# frozen_string_literal: true

require "advent"

class Day12 < Advent::Solution
  def part1(input: load_input)
    grid = prepare(input)
    _, starting_point = grid.find { |_key, node| node.start? }
    _, end_point = grid.find { |_key, node| node.end? }
    recents = [starting_point]
    distance = 1

    until recents.empty?
      nodes = recents.flat_map do |node|
        neighbours = node.neighbours.map do |neighbour|
          grid[neighbour]
        end

        neighbours.compact.reject(&:explored?).filter do |neighbour|
          neighbour.elevation <= node.elevation + 1
        end
      end

      nodes.each do |node|
        node.distance = distance
      end

      recents = nodes.uniq
      distance += 1
    end

    end_point.distance
  end

  def part2(input: load_input)
  end

  private

  def prepare(input)
    input.lines(chomp: true).each_with_index.each_with_object({}) do |(line, y), grid|
      line.chars.each_with_index do |char, x|
        grid[[x, y]] = Node.new(char, x, y)
      end
    end
  end
end

class Node
  attr_accessor :distance
  attr_reader :letter, :x, :y

  def initialize(letter, x, y)
    @letter = letter
    @x = x
    @y = y

    if @letter == "S"
      @distance = 0
    end
  end

  def explored?
    !@distance.nil?
  end

  def elevation
    case @letter
    when "S"
      0
    when "E"
      25
    else
      @letter.ord - "a".ord
    end
  end

  def neighbours
    [
      [x + 1, y],
      [x - 1, y],
      [x, y + 1],
      [x, y - 1]
    ]
  end

  def start?
    @letter == "S"
  end

  def end?
    @letter == "E"
  end
end
