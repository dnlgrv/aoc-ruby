require "advent"
require "minitest/autorun"

require_relative "../../2023/day3"

SAMPLE_INPUT = DATA.read.chomp

class Day3Test < Advent::TestCase
  def setup
    @solution = Day3.new
  end

  def test_part_1
    assert_equal 4361, @solution.part_1(input: SAMPLE_INPUT)
  end

  def test_part_2
    assert_equal 467835, @solution.part_2(input: SAMPLE_INPUT)
  end
end

__END__
467..114..
...*......
..35..633.
......#...
617*......
.....+.58.
..592.....
......755.
...$.*....
.664.598..
