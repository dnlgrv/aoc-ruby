# frozen_string_literal: true

require "advent"
require "minitest/autorun"

require_relative "../day9"

EXAMPLE_INPUT = "R 4
U 4
L 3
D 1
R 4
D 1
L 5
R 2"

class Day9Test < Advent::TestCase
  def setup
    @solution = Day9.new
  end

  def test_part1
    assert_equal 13, @solution.part1(input: EXAMPLE_INPUT)
  end

  # def test_part2
  #   assert_equal 123, @solution.part2
  # end
end
