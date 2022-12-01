# frozen_string_literal: true

require "advent"
require "minitest/autorun"

require_relative "../day1"

class Day1Test < Advent::TestCase
  def setup
    @solution = Day1.new
    @input = "1000
2000
3000

4000

5000
6000

7000
8000
9000

10000"
  end

  def test_part1
    assert_equal 24000, @solution.part1(input: @input)
  end

  def test_part2
    assert_equal 45000, @solution.part2(input: @input)
  end
end
