# frozen_string_literal: true

require "advent"

class Day1 < Advent::Solution
  def part1(input: load_input)
    input.each_char.reduce(0) do |floor, char|
      navigate floor, char
    end
  end

  def part2(input: load_input)
    input.each_char.with_index.reduce(0) do |floor, (char, index)|
      new_floor = navigate floor, char

      if in_basement?(new_floor)
        break index + 1
      end

      new_floor
    end
  end

  private

  def navigate(floor, char)
    case char
    when "("
      floor + 1

    when ")"
      floor - 1
    end
  end

  def in_basement?(floor)
    floor == -1
  end
end
