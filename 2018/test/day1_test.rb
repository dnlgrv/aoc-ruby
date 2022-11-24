# frozen_string_literal: true

require "advent"
require "minitest/autorun"

require_relative "../day1"

class Day1Test < Advent::TestCase
  def setup
    @solution = Day1.new
  end

  def test_part1
    assert_equal 3, @solution.part1(input: "+1\n+1\n+1")
    assert_equal 0, @solution.part1(input: "+1\n+1\n-2")
    assert_equal(-6, @solution.part1(input: "-2\n-2\n-2"))
  end

  def test_part2
    assert_equal 0, @solution.part2(input: "+1\n-1")
    assert_equal 10, @solution.part2(input: "+3\n+3\n+4\n-2\n-4")
    assert_equal 5, @solution.part2(input: "-6\n+3\n+8\n+5\n-6")
    assert_equal 14, @solution.part2(input: "+7\n+7\n-2\n-7\n-4")
  end
end
