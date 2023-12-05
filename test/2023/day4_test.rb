require "advent"
require "minitest/autorun"

require_relative "../../2023/day4"

SAMPLE_INPUT = DATA.read.chomp

class Day4Test < Advent::TestCase
  def setup
    @solution = Day4.new
  end

  def test_part_1
    assert_equal 13, @solution.part_1(input: SAMPLE_INPUT)
  end

  def test_part_2
    assert_equal 30, @solution.part_2(input: SAMPLE_INPUT)
  end
end

__END__
Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19
Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1
Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83
Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36
Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11