# frozen_string_literal: true

require "advent"
require "minitest/autorun"

require_relative "../day13"

class Day13Test < Advent::TestCase
  INPUT = DATA.read

  def setup
    @solution = Day13.new
  end

  def test_part1
    assert @solution.correct_order? [1, 1, 3, 1, 1], [1, 1, 5, 1, 1]
    assert @solution.correct_order? [[1], [2, 3, 4]], [[1], 4]
    refute @solution.correct_order? [9], [[8, 7, 6]]
    assert @solution.correct_order? [[4, 4], 4, 4], [[4, 4], 4, 4, 4]
    refute @solution.correct_order? [7, 7, 7, 7], [7, 7, 7]
    assert @solution.correct_order? [], [3]
    refute @solution.correct_order? [[[]]], [[]]
    refute @solution.correct_order? [1, [2, [3, [4, [5, 6, 7]]]], 8, 9], [1, [2, [3, [4, [5, 6, 0]]]], 8, 9]

    assert_equal 13, @solution.part1(input: INPUT)
  end

  # def test_part2
  #   assert_equal 123, @solution.part2
  # end
end

__END__
[1,1,3,1,1]
[1,1,5,1,1]

[[1],[2,3,4]]
[[1],4]

[9]
[[8,7,6]]

[[4,4],4,4]
[[4,4],4,4,4]

[7,7,7,7]
[7,7,7]

[]
[3]

[[[]]]
[[]]

[1,[2,[3,[4,[5,6,7]]]],8,9]
[1,[2,[3,[4,[5,6,0]]]],8,9]
