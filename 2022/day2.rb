# frozen_string_literal: true

require "advent"

class Day2 < Advent::Solution
  WIN = 6
  DRAW = 3
  LOSS = 0

  ROCK = 1
  PAPER = 2
  SCISSORS = 3

  def part1(input: load_input)
    prepare(input).sum do |(opponent, shape)|
      shape_score = case shape
      when "X"
        1
      when "Y"
        2
      when "Z"
        3
      end

      round_score = case [opponent, shape]
      when ["A", "X"]
        DRAW
      when ["A", "Y"]
        WIN
      when ["A", "Z"]
        LOSS

      when ["B", "X"]
        LOSS
      when ["B", "Y"]
        DRAW
      when ["B", "Z"]
        WIN

      when ["C", "X"]
        WIN
      when ["C", "Y"]
        LOSS
      when ["C", "Z"]
        DRAW
      end

      shape_score + round_score
    end
  end

  def part2(input: load_input)
    prepare(input).sum do |(opponent, outcome)|
      shape_score = case [opponent, outcome]
      when ["A", "X"]
        SCISSORS
      when ["B", "X"]
        ROCK
      when ["C", "X"]
        PAPER

      when ["A", "Y"]
        ROCK
      when ["B", "Y"]
        PAPER
      when ["C", "Y"]
        SCISSORS

      when ["A", "Z"]
        PAPER
      when ["B", "Z"]
        SCISSORS
      when ["C", "Z"]
        ROCK
      end

      round_score = case outcome
      when "X"
        LOSS
      when "Y"
        DRAW
      when "Z"
        WIN
      end

      shape_score + round_score
    end
  end

  private

  def prepare(input)
    input.split("\n").map do |round|
      round.split(" ")
    end
  end
end
