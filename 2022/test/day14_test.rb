# frozen_string_literal: true

require "advent"
require "minitest/autorun"

require_relative "../day14"

class Day14Test < Advent::TestCase
  INPUT = DATA.read

  def setup
    @solution = Day14.new
  end

  def test_part1
    assert_equal 24, @solution.part1(input: INPUT)
  end

  def test_part2
    assert_equal 93, @solution.part2(input: INPUT)
  end
end

__END__
498,4 -> 498,6 -> 496,6
503,4 -> 502,4 -> 502,9 -> 494,9
