# frozen_string_literal: true

require "advent"

class Day1 < Advent::Solution
  def part1(input: load_input)
    pair = prepare(input).to_a.permutation(2).find do |(a, b)|
      a + b == 2020
    end

    pair.inject(:*)
  end

  def part2(input: load_input)
    trio = prepare(input).to_a.permutation(3).find do |(a, b, c)|
      a + b + c == 2020
    end

    trio.inject(:*)
  end

  private

  def prepare(input)
    input.split.map(&:to_i)
  end
end
