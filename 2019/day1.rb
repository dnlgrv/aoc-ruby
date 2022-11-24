# frozen_string_literal: true

require "advent"

class Day1 < Advent::Solution
  def part1(input: load_input)
    prepare(input).sum do |mass|
      (mass / 3).floor - 2
    end
  end

  def part2(input: load_input)
  end

  private

  def prepare(input)
    input.split.map(&:to_i)
  end
end
