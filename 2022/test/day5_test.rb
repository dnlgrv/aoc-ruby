# frozen_string_literal: true

require "advent"
require "minitest/autorun"

require_relative "../day5"

class Day5Test < Advent::TestCase
  INPUT = DATA.read

  def setup
    @solution = Day5.new
  end

  def test_part1
    assert_equal "CMZ", @solution.part1(input: INPUT)
  end

  def test_part2
    assert_equal "MCD", @solution.part2(input: INPUT)
  end
end

__END__
    [D]    
[N] [C]    
[Z] [M] [P]
 1   2   3 

move 1 from 2 to 1
move 3 from 1 to 3
move 2 from 2 to 1
move 1 from 1 to 2
