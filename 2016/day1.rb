# frozen_string_literal: true

require "advent"

class Day1 < Advent::Solution
  def part1(input: load_input)
    person = prepare(input).each_with_object(Person.new) do |instruction, person|
      case instruction
      in ["R", number]
        person.turn_right
        person.move number

      in ["L", number]
        person.turn_left
        person.move number
      end
    end

    person.x.abs + person.y.abs
  end

  def part2(input: load_input)
    person = prepare(input).each_with_object(Person.new) do |instruction, person|
      case instruction
      in ["R", number]
        person.turn_right

        number.times do
          person.move 1
          person.track_position
        end

      in ["L", number]
        person.turn_left

        number.times do
          person.move 1
          person.track_position
        end
      end
    end

    x, y = person.visited.find do |visited_position|
      person.visited.count(visited_position) > 1
    end

    x.abs + y.abs
  end

  class Person
    attr_reader :x, :y, :visited

    def initialize
      @facing = :north
      @x = 0
      @y = 0
      @visited = []
    end

    def move(distance)
      case @facing
      when :north
        @y += distance
      when :east
        @x += distance
      when :south
        @y -= distance
      when :west
        @x -= distance
      end
    end

    def track_position
      @visited << [@x, @y]
    end

    def turn_left
      @facing = case @facing
      when :north
        :west
      when :east
        :north
      when :south
        :east
      when :west
        :south
      end
    end

    def turn_right
      @facing = case @facing
      when :north
        :east
      when :east
        :south
      when :south
        :west
      when :west
        :north
      end
    end
  end

  private

  def prepare(input)
    input.chomp.split(", ").map do |instruction|
      [instruction[0], instruction[1..].to_i]
    end
  end
end
