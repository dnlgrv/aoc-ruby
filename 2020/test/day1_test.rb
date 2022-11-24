# frozen_string_literal: true

require "advent"
require "minitest/autorun"

require_relative "../day1"

class Day1Test < Advent::TestCase
  def setup
    @solution = Day1.new
  end

  def test_part1
    assert_equal 514579, @solution.part1(input: "1721\n979\n366\n299\n675\n1456")
  end

  def test_part2
    assert_equal 241861950, @solution.part2(input: "1721\n979\n366\n299\n675\n1456")
  end
end
