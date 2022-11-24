# frozen_string_literal: true

require "advent"

class Day1 < Advent::Solution
  def part1(input: load_input)
    prepare(input).sum
  end

  def part2(input: load_input)
    frequencies = [0]

    prepare(input).cycle.each do |adjustment|
      frequency = frequencies.last + adjustment

      if frequencies.include? frequency
        break frequency
      else
        frequencies << frequency
      end
    end
  end

  private

  def prepare(input)
    input.split.map(&:to_i)
  end
end
