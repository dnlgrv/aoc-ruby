# frozen_string_literal: true

require "advent"
require "minitest/autorun"

require_relative "../day8"

class Day8Test < Advent::TestCase
  INPUT = DATA.read

  def setup
    @solution = Day8.new
  end

  def test_part1
    assert_equal 21, @solution.part1(input: INPUT)
  end

  def test_part2
    assert_equal 8, @solution.part2(input: INPUT)
  end
end

__END__
30373
25512
65332
33549
35390
