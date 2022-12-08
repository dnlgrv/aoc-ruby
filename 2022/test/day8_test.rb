# frozen_string_literal: true

require "advent"
require "minitest/autorun"

require_relative "../day8"

class Day8Test < Advent::TestCase
  def setup
    @solution = Day8.new
    @example_input = "30373
25512
65332
33549
35390"
  end

  def test_part1
    assert_equal 21, @solution.part1(input: @example_input)
  end

  def test_part2
    assert_equal 8, @solution.part2(input: @example_input)
  end
end
