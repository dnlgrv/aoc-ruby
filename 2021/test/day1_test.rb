# frozen_string_literal: true

require "advent"
require "minitest/autorun"

require_relative "../day1"

class Day1Test < Advent::TestCase
  def setup
    @solution = Day1.new
    @input = %(
      199
      200
      208
      210
      200
      207
      240
      269
      260
      263
    )
  end

  def test_part1
    assert_equal 7, @solution.part1(input: @input)
  end

  def test_part2
    assert_equal 5, @solution.part2(input: @input)
  end
end
