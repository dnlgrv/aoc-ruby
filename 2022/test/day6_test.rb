# frozen_string_literal: true

require "advent"
require "minitest/autorun"

require_relative "../day6"

class Day6Test < Advent::TestCase
  def setup
    @solution = Day6.new
  end

  def test_part1
    assert_equal 7, @solution.part1(input: "mjqjpqmgbljsphdztnvjfqwrcgsmlb")
    assert_equal 5, @solution.part1(input: "bvwbjplbgvbhsrlpgdmjqwftvncz")
    assert_equal 6, @solution.part1(input: "nppdvjthqldpwncqszvftbrmjlhg")
    assert_equal 10, @solution.part1(input: "nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg")
    assert_equal 11, @solution.part1(input: "zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw")
  end

  def test_part2
    assert_equal 19, @solution.part2(input: "mjqjpqmgbljsphdztnvjfqwrcgsmlb")
    assert_equal 23, @solution.part2(input: "bvwbjplbgvbhsrlpgdmjqwftvncz")
    assert_equal 23, @solution.part2(input: "nppdvjthqldpwncqszvftbrmjlhg")
    assert_equal 29, @solution.part2(input: "nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg")
    assert_equal 26, @solution.part2(input: "zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw")
  end
end
