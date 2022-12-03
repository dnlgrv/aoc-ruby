# frozen_string_literal: true

require "advent"

class Day3 < Advent::Solution
  TYPES = ("a".."z").to_a + ("A".."Z").to_a

  def part1(input: load_input)
    prepare(input).sum do |rucksack|
      half = rucksack.length / 2
      first_half = rucksack[...half]
      second_half = rucksack[half..]

      duplicate_item = first_half.chars.intersection(second_half.chars).first

      priority duplicate_item
    end
  end

  def part2(input: load_input)
  end
   
  private

  def prepare(input)
    input.split("\n")
  end

  def priority(char)
    TYPES.index(char) + 1
  end
end
