# frozen_string_literal: true

require "advent"
require "minitest/autorun"

require_relative "../day3"

class Day3Test < Advent::TestCase
  INPUT = DATA.read

  def setup
    @solution = Day3.new
  end

  def test_part1
    assert_equal 157, @solution.part1(input: INPUT)
  end

  def test_part2
    assert_equal 70, @solution.part2(input: INPUT)
  end
end

__END__
vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw
