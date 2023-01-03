# frozen_string_literal: true

require "advent"

class Day13 < Advent::Solution
  attr_reader :debug

  def initialize(debug: false)
    super()
    @debug = debug
  end

  def part1(input: load_input)
    prepare(input).each_slice(2).each_with_index.reduce([]) do |indices, ((packet_a, packet_b), index)|
      if correct_order? packet_a, packet_b
        indices << index + 1
      else
        indices
      end
    end.sum
  end

  def part2(input: load_input)
    with_dividers = prepare(input).concat([[[2]], [[6]]]).sort do |left, right|
      correct_order?(left, right) ? -1 : 1
    end

    first_divider_index = with_dividers.find_index { _1 == [[2]] } + 1
    second_divider_index = with_dividers.find_index { _1 == [[6]] } + 1

    first_divider_index * second_divider_index
  end

  def correct_order?(left, right)
    return nil if left.empty? && right.empty?
    return true if left.empty?
    return false if right.empty?

    left_head, *left_tail = left
    right_head, *right_tail = right

    say "Comparing: #{left_head} & #{right_head}"

    case [left_head, right_head]
    in [Integer, Integer]
      return true if left_head < right_head
      return false if left_head > right_head
    else
      result = correct_order? wrap(left_head), wrap(right_head)
    end

    say "  Result: #{result}"

    if result.nil?
      correct_order? left_tail, right_tail
    else
      result
    end
  end

  private

  def say(message)
    puts message if debug
  end

  def prepare(input)
    input.lines(chomp: true).map(&method(:eval)).compact
  end

  def wrap(object)
    if object.is_a?(Array)
      object.to_ary
    else
      [object]
    end
  end
end
