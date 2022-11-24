# frozen_string_literal: true

require "advent"
require "minitest/autorun"

require_relative "../day1"

class Day1Test < Advent::TestCase
  def setup
    @solution = Day1.new
  end

  def test_part1
    assert_equal 2, @solution.part1(input: "12")
    assert_equal 2, @solution.part1(input: "14")
    assert_equal 654, @solution.part1(input: "1969")
    assert_equal 33583, @solution.part1(input: "100756")
  end

  # def test_part2
  #   assert_equal 123, @solution.part2
  # end
end
