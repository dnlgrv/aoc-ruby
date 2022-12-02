# frozen_string_literal: true

require "advent"
require "minitest/autorun"

require_relative "../day2"

class Day2Test < Advent::TestCase
  def setup
    @solution = Day2.new
    @input = "A Y
B X
C Z"
  end

  def test_part1
    assert_equal 15, @solution.part1(input: @input)
  end

  def test_part2
    assert_equal 12, @solution.part2(input: @input)
  end
end
