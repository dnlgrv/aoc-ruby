require "advent"
require "minitest/autorun"

require_relative "../../2023/day3"

class Day3Test < Advent::TestCase
  def setup
    @solution = Day3.new
  end

  def test_part_1
    assert_equal 4361, @solution.part_1(input: DATA.read.chomp)
  end

  # def test_part_2
  #   assert_equal 123, @solution.part_2
  # end
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
