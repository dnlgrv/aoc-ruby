# frozen_string_literal: true

require "advent"
require "minitest/autorun"

require_relative "../day4"

class Day4Test < Advent::TestCase
  INPUT = DATA.read

  def setup
    @solution = Day4.new
  end

  def test_part1
    assert_equal 2, @solution.part1(input: INPUT)
  end

  def test_part2
    assert_equal 4, @solution.part2(input: INPUT)
  end
end

__END__
2-4,6-8
2-3,4-5
5-7,7-9
2-8,3-7
6-6,4-6
2-6,4-8
