# frozen_string_literal: true

require "advent"
require "debug"

class Day9 < Advent::Solution
  def part1(input: load_input)
    knot = prepare(input).each_with_object(Knot.new) do |(direction, amount), knot|
      puts "== #{direction}#{amount} =="

      amount.times do
        case direction
        in :U
          knot.move_up
        in :D
          knot.move_down
        in :L
          knot.move_left
        in :R
          knot.move_right
        end

        Debugger.draw 6, 5, knot.head, knot.tail
      end
    end

    knot.tail_locations.size
  end

  def part2(input: load_input)
  end

  private

  def prepare(input)
    input.split("\n").map do |line|
      direction, amount = line.split
      [direction.to_sym, amount.to_i]
    end
  end
end

class Knot
  attr_reader :head, :tail, :tail_locations

  def initialize
    @head = [0, 0]
    @previous_head = [0, 0]

    @tail = [0, 0]

    @tail_locations = Set.new
    @tail_locations.add [0, 0]
  end

  def move_up
    @previous_head = @head.dup
    @head[1] += 1
    move_tail
  end

  def move_down
    @previous_head = @head.dup
    @head[1] -= 1
    move_tail
  end

  def move_left
    @previous_head = @head.dup
    @head[0] -= 1
    move_tail
  end

  def move_right
    @previous_head = @head.dup
    @head[0] += 1
    move_tail
  end

  private

  def move_tail
    return if tail_adjacent?
    @tail = @previous_head
    @tail_locations.add @tail.dup
  end

  def tail_adjacent?
    (@head[0] - @tail[0]).abs <= 1 && (@head[1] - @tail[1]).abs <= 1
  end
end

class Debugger
  def self.draw(width, height, head, tail)
    height.times.map do |y|
      width.times.map do |x|
        case [x, y]
        in ^head
          "H"
        in ^tail
          "T"
        else
          "."
        end
      end.join("")
    end.reverse.tap do |line|
      puts line
    end

    puts ""
  end
end
