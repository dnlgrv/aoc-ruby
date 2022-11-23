# frozen_string_literal: true

require "advent"

class Day1 < Advent::Solution
  def part1(input: load_input)
    input.each_char.reduce(0) do |floor, char|
      case char
      when "("
        floor + 1

      when ")"
        floor - 1
      end
    end
  end

  def part2(input: load_input)
  end
end
