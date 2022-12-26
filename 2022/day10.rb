# frozen_string_literal: true

require "advent"

class Day10 < Advent::Solution
  def part1(input: load_input)
    output = prepare(input).each_with_object([1]) do |instruction, signals|
      signals.push(signals.last)
      signals.push(signals.last + instruction) unless instruction == :noop
    end

    [20, 60, 100, 140, 180, 220].sum do |cycle|
      output[cycle - 1] * cycle
    end
  end

  def part2(input: load_input)
    print "\n"

    instructions = prepare(input).to_enum
    execute = nil

    0.upto(39).cycle(6).each_with_object([0, 1, 2]) do |x, sprite|
      print "\n" if x == 0

      if sprite.include? x
        print "#"
      else
        print "."
      end

      if execute.nil?
        instruction = instructions.next

        unless instruction == :noop
          execute = [(x + 1) % 40, instruction]
        end
      elsif execute[0] == x
        sprite[1] += execute[1]
        sprite[0] = sprite[1] - 1
        sprite[2] = sprite[1] + 1

        execute = nil
      end
    end
  rescue StopIteration
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
