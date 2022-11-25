# frozen_string_literal: true

require "advent"
require "minitest/autorun"

require_relative "../day2"

class Day2Test < Advent::TestCase
  def setup
    @solution = Day2.new
  end

  def test_part1
    assert_equal 3500, @solution.part1(input: "1,9,10,3,2,3,11,0,99,30,40,50", solve: false)
  end

  # def test_part2
  #   assert_equal 123, @solution.part2
  # end
end
