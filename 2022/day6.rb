# frozen_string_literal: true

require "advent"

class Day6 < Advent::Solution
  def part1(input: load_input)
    find_consecutive_unique_index(prepare(input), 4)
  end

  def part2(input: load_input)
    find_consecutive_unique_index(prepare(input), 14)
  end

  private

  def prepare(input)
    input.chars
  end

  def find_consecutive_unique_index(input, count)
    input.each_cons(count).with_index.find_index do |arr, index|
      arr.uniq.size == count
    end + count
  end
end
