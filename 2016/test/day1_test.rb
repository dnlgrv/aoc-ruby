# frozen_string_literal: true

require "advent"
require "minitest/autorun"

require_relative "../day1"

class Day1Test < Advent::TestCase
  def setup
    @solution = Day1.new
  end

  def test_part1
    assert_equal 5, @solution.part1(input: "R2, L3")
    assert_equal 2, @solution.part1(input: "R2, R2, R2")
    assert_equal 12, @solution.part1(input: "R5, L5, R5, R3")
  end

  def test_part2
    assert_equal 4, @solution.part2(input: "R8, R4, R4, R8")
  end
end
