# frozen_string_literal: true

require "advent"
require "minitest/autorun"

require_relative "../day11"

class Day11Test < Advent::TestCase
  INPUT = DATA.read

  def setup
    @solution = Day11.new
  end

  def test_part1
    assert_equal 10605, @solution.part1(input: INPUT)
  end

  def test_part2
    assert_equal 2713310158, @solution.part2(input: INPUT)
  end
end

__END__
Monkey 0:
  Starting items: 79, 98
  Operation: new = old * 19
  Test: divisible by 23
    If true: throw to monkey 2
    If false: throw to monkey 3

Monkey 1:
  Starting items: 54, 65, 75, 74
  Operation: new = old + 6
  Test: divisible by 19
    If true: throw to monkey 2
    If false: throw to monkey 0

Monkey 2:
  Starting items: 79, 60, 97
  Operation: new = old * old
  Test: divisible by 13
    If true: throw to monkey 1
    If false: throw to monkey 3

Monkey 3:
  Starting items: 74
  Operation: new = old + 3
  Test: divisible by 17
    If true: throw to monkey 0
    If false: throw to monkey 1
