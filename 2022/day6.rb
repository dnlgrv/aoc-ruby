# frozen_string_literal: true

require "advent"

class Day6 < Advent::Solution
  def part1(input: load_input)
    prepare(input).each_cons(4).with_index do |quad, index|
      if quad.uniq.size == 4
        return index + 1 + 3 # index offset + consecutive offset
      end
    end
  end

  def part2(input: load_input)
    prepare(input).each_cons(14).with_index do |quad, index|
      if quad.uniq.size == 14
        return index + 1 + 13 # index offset + consecutive offset
      end
    end
  end

  private

  def prepare(input)
    input.chars
  end
end
