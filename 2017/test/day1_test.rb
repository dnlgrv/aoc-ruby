# frozen_string_literal: true

require "advent"
require "minitest/autorun"

require_relative "../day1"

class Day1Test < Advent::TestCase
  def setup
    @solution = Day1.new
  end

  def test_part1
    assert_equal 3, @solution.part1(input: "1122")
    assert_equal 4, @solution.part1(input: "1111")
    assert_equal 0, @solution.part1(input: "1234")
    assert_equal 9, @solution.part1(input: "91212129")
  end

  # def test_part2
  #   assert_equal 123, @solution.part2
  # end
end
