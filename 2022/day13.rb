# frozen_string_literal: true

require "advent"

class Day13 < Advent::Solution
  attr_reader :debug

  def initialize(debug: false)
    super()
    @debug = debug
  end

  def part1(input: load_input)
    prepare(input).each_with_index.reduce([]) do |indices, ((packet_a, packet_b), index)|
      if correct_order? packet_a, packet_b
        indices << index + 1
      else
        indices
      end
    end.sum
  end

  def part2(input: load_input)
  end

  def correct_order?(packet_a, packet_b)
    return :equal if packet_a == packet_b

    packet_a.each_with_index do |left, index|
      right = packet_b[index]

      say "Comparing #{left} vs #{right}"
      result = compare_values left, right
      say "  Result: #{result}"

      return result unless result == :equal
    end
  end

  private

  def say(message)
    puts message if debug
  end

  def prepare(input)
    input.split("\n\n").map do |lines|
      packet_a, packet_b = lines.split("\n")
      [eval(packet_a), eval(packet_b)]
    end
  end

  def compare_values(left, right)
    return false if right.nil?

    # If both are integers we can compare.
    # If the left is lower, we're in order.
    # If the right is lower, we're not in order.
    # If they're the same, continue checking other values.
    if left.is_a?(Integer) && right.is_a?(Integer)
      return true if left < right
      return false if left > right
      return :equal if left == right
    end

    if left.is_a?(Array) || right.is_a?(Array)
      correct_order? wrap(left), wrap(right)
    end
  end

  def wrap(object)
    if object.is_a?(Array)
      object.to_ary
    else
      [object]
    end
  end
end
