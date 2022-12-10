# frozen_string_literal: true

require "advent"

class Day10 < Advent::Solution
  def part1(input: load_input)
    output = prepare(input).reduce([1]) do |signals, instruction|
      signals.push(signals.last)

      unless instruction == :noop
        signals.push(signals.last + instruction)
      end

      signals
    end

    [20, 60, 100, 140, 180, 220].sum do |cycle|
      output[cycle - 1] * cycle
    end
  end

  def part2(input: load_input)
  end

  private

  def prepare(input)
    input.split("\n").map do |line|
      case line.split
      in ["noop"]
        :noop

      in ["addx", number]
        number.to_i
      end
    end
  end
end
