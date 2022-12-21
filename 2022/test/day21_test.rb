# frozen_string_literal: true

require "advent"
require "minitest/autorun"

require_relative "../day21"

class Day21Test < Advent::TestCase
  def setup
    @solution = Day21.new
  end

  def test_part1
    assert_equal 152, @solution.part1(input: DATA.read)
  end

  # def test_part2
  #   assert_equal 123, @solution.part2
  # end
end

__END__
root: pppw + sjmn
dbpl: 5
cczh: sllz + lgvd
zczc: 2
ptdq: humn - dvpt
dvpt: 3
lfqf: 4
humn: 5
ljgn: 2
sjmn: drzm * dbpl
sllz: 4
pppw: cczh / lfqf
lgvd: ljgn * ptdq
drzm: hmdt - zczc
hmdt: 32
