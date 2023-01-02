# frozen_string_literal: true

require "advent"
require "minitest/autorun"

require_relative "../day12"

class Day12Test < Advent::TestCase
  INPUT = DATA.read

  def setup
    @solution = Day12.new
  end

  def test_part1
    assert_equal 31, @solution.part1(input: INPUT)
  end

  def test_part2
    assert_equal 29, @solution.part2(input: INPUT)
  end
end

__END__
Sabqponm
abcryxxl
accszExk
acctuvwj
abdefghi
