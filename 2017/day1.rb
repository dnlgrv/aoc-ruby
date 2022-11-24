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
    digits = prepare input, circular: false

    length = digits.length
    half_length = digits.length / 2

    digits.each_with_index.reduce(0) do |total, (digit, index)|
      offset_wrapped = (index + half_length) % length

      if digit == digits[offset_wrapped]
        total + digit
      else
        total
      end
    end
  end

  private

  def prepare(input, circular: true)
    digits = input.chomp.chars.map(&:to_i)

    if circular
      # append the first digit to the end of the sequence
      digits << digits[0]
    else
      digits
    end
  end
end
