# frozen_string_literal: true

require "advent"

class Day4 < Advent::Solution
  def part1(input: load_input)
    prepare(input).count do |pair|
      pair[0].cover?(pair[1]) || pair[1].cover?(pair[0])
    end
  end

  def part2(input: load_input)
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
