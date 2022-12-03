# frozen_string_literal: true

require "advent"
require "minitest/autorun"

require_relative "../day3"

class Day3Test < Advent::TestCase
  def setup
    @solution = Day3.new
    @input = "vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw"
  end

  def test_part1
    assert_equal 157, @solution.part1(input: @input)
  end

  def test_part2
    assert_equal 70, @solution.part2(input: @input)
  end
end
