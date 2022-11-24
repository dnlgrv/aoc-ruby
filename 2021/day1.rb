# frozen_string_literal: true

require "advent"

class Day1 < Advent::Solution
  def part1(input: load_input)
    count_successive_increments prepare(input)
  end

  def part2(input: load_input)
    windows = prepare(input).each_cons(3).filter do |group|
      group.compact.length == 3
    end

    count_successive_increments windows.map(&:sum)
  end

  private

  def count_successive_increments(arr)
    arr.each_cons(2).count do |(a, b)|
      b > a
    end
  end

  def prepare(input)
    input.split.map(&:to_i)
  end
end
