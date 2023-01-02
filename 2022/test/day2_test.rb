# frozen_string_literal: true

require "advent"
require "minitest/autorun"

require_relative "../day2"

class Day2Test < Advent::TestCase
  INPUT = DATA.read

  def setup
    @solution = Day2.new
  end

  def test_part1
    assert_equal 15, @solution.part1(input: INPUT)
  end

  def test_part2
    assert_equal 12, @solution.part2(input: INPUT)
  end
end

__END__
A Y
B X
C Z
