# frozen_string_literal: true

require "advent"

class Day4 < Advent::Solution
  def part1(input: load_input)
    prepare(input).count do |(elf_a, elf_b)|
      elf_a.cover?(elf_b) || elf_b.cover?(elf_a)
    end
  end

  def part2(input: load_input)
    prepare(input).count do |(elf_a, elf_b)|
      elf_a.to_a.intersection(elf_b.to_a).size > 0
    end
  end

  private

  def prepare(input)
    input.split("\n").map do |pair|
      pair.split(",").map do |elf|
        sections = elf.split("-")
        sections[0].to_i..sections[1].to_i
      end
    end
  end
end
