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

  # def test_part2
  #   assert_equal 123, @solution.part2
  # end
end
