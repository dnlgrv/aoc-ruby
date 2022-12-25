# frozen_string_literal: true

require "advent"
require "debug"

class Day9 < Advent::Solution
  def part1(input: load_input)
    part2(input: input, number_of_knots: 1)
  end

  def part2(input: load_input, number_of_knots: 9)
    head = Head.new(0, 0)
    knots = (1..number_of_knots).reduce([]) do |arr, x|
      arr << Knot.new(x.to_s, 0, 0, arr.last || head)
    end

    prepare(input).each do |(instruction, amount)|
      case instruction
      when "U"
        amount.times do
          head.move_up
          knots.each(&:move)
        end

      when "D"
        amount.times do
          head.move_down
          knots.each(&:move)
        end

      when "L"
        amount.times do
          head.move_left
          knots.each(&:move)
        end

      when "R"
        amount.times do
          head.move_right
          knots.each(&:move)
        end
      end
    end

    knots.last.visits.size
  end

  private

  def prepare(input)
    input.lines(chomp: true).map do |line|
      direction, amount = line.split " "

      [direction, amount.to_i]
    end
  end
end

class Knot
  attr_reader :id, :position, :visits

  def initialize(id, x, y, following)
    @id = id
    @following = following
    @position = [x, y]

    @visits = Set.new
    @visits.add @position.dup
  end

  def move
    return if adjacent?

    if @following.position[0] > @position[0]
      @position[0] += 1
    elsif @following.position[0] < @position[0]
      @position[0] -= 1
    end

    if @following.position[1] > @position[1]
      @position[1] += 1
    elsif @following.position[1] < @position[1]
      @position[1] -= 1
    end

    @visits.add @position.dup
  end

  private

  def adjacent?
    (@following.position[0] - @position[0]).abs <= 1 && (@following.position[1] - @position[1]).abs <= 1
  end
end

class Head < Knot
  def initialize(x, y)
    super "H", x, y, nil
  end

  def move_up
    @position[1] += 1
  end

  def move_down
    @position[1] -= 1
  end

  def move_left
    @position[0] -= 1
  end

  def move_right
    @position[0] += 1
  end
end

class Grid
  def initialize(width, height)
    @width = width
    @height = height
  end

  def draw(knots = [])
    print "\n"

    (0...@height).to_a.reverse_each do |y|
      (0...@width).each do |x|
        knot = knots.find do |knot|
          knot.position == [x, y]
        end

        print knot&.id || "."
      end

      print "\n"
    end

    print "\n"
  end
end
