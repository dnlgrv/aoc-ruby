# frozen_string_literal: true

require "advent"
require "minitest/autorun"

require_relative "../day9"

class Day9Test < Advent::TestCase
  INPUT = DATA.read
  
  def setup
    @solution = Day9.new
  end

  def test_part1
    assert_equal 13, @solution.part1(input: INPUT.split("---").first)
  end

  def test_part2
    assert_equal 36, @solution.part2(input: INPUT.split("---").last)
  end
end

__END__
R 4
U 4
L 3
D 1
R 4
D 1
L 5
R 2
---
R 5
U 8
L 8
D 3
R 17
D 10
L 25
U 20
