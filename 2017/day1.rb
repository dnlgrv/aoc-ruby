# frozen_string_literal: true

require "advent"

class Day1 < Advent::Solution
  def part1(input: load_input)
    digits = prepare input

    digits.each_with_index.reduce(0) do |total, (digit, index)|
      if digit == digits[index + 1]
        total + digit
      else
        total
      end
    end
  end

  def part2(input: load_input)
  end

  private

  def prepare(input)
    digits = input.chomp.chars.map(&:to_i)
    digits << digits[0] # append the first digit to the end of the sequence
  end
end
