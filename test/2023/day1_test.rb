# frozen_string_literal: true

require "advent"
require "minitest/autorun"

require_relative "../day1"

class Day1Test < Advent::TestCase
  def setup
    @solution = Day1.new
  end

  def test_part1
    input = """1abc2
pqr3stu8vwx
a1b2c3d4e5f
treb7uchet
"""

    assert_equal 142, @solution.part1(input:)
  end

  def test_part2
    input = """two1nine
eightwothree
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen
"""
    assert_equal 281, @solution.part2(input:)
  end
end
