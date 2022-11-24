# frozen_string_literal: true

require "advent"

class Day1 < Advent::Solution
  def part1(input: load_input)
    prepare(input).each_cons(2).count do |(a, b)|
      b > a
    end
  end

  def part2(input: load_input)
  end

  private

  def prepare(input)
    input.split.map(&:to_i)
  end
end
