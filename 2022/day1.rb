# frozen_string_literal: true

require "advent"

class Day1 < Advent::Solution
  def part1(input: load_input)
    prepare(input).map(&:sum).max
  end

  def part2(input: load_input)
  end

  private

  def prepare(input)
    input.split(/\n{2,}/).map do |elf|
      elf.split.map(&:to_i)
    end
  end
end
