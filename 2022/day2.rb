# frozen_string_literal: true

require "advent"

class Day2 < Advent::Solution
  def part1(input: load_input)
    prepare(input).map do |(opponent, player)|
      [letter_to_shape(opponent), letter_to_shape(player)]
    end.sum(&method(:play_round))
  end

  def part2(input: load_input)
    prepare(input).map do |(opponent, outcome)|
      opponent = letter_to_shape(opponent)
      [opponent, desired_outcome_to_shape(outcome, opponent)]
    end.sum(&method(:play_round))
  end

  private

  def prepare(input)
    input.split("\n").map do |round|
      round.split(" ")
    end
  end

  def letter_to_shape(letter)
    case letter
    when "A", "X"
      Rock.new
    when "B", "Y"
      Paper.new
    when "C", "Z"
      Scissors.new
    end
  end

  def desired_outcome_to_shape(outcome, opponent)
    outcome = letter_to_outcome(outcome)

    case [outcome, opponent]
    in [:draw, shape]
      shape.class.new

    in [:win, Rock]
      Paper.new
    in [:win, Paper]
      Scissors.new
    in [:win, Scissors]
      Rock.new

    in [:lose, Rock]
      Scissors.new
    in [:lose, Paper]
      Rock.new
    in [:lose, Scissors]
      Paper.new
    end
  end

  def letter_to_outcome(letter)
    case letter
    when "X"
      :lose
    when "Y"
      :draw
    when "Z"
      :win
    end
  end

  def play_round((opponent, player))
    round = Round.new(player, opponent)
    round.play!

    case round.outcome_for(player)
    when :win
      player.score + 6
    when :draw
      player.score + 3
    when :lose
      player.score
    end
  end
end

class Round
  attr_reader :a, :b

  def initialize(a, b)
    @a = a
    @b = b
    @outcomes = {}
  end

  def play!
    @outcomes[a], @outcomes[b] = case [a, b]
    in [shape, ^shape]
      [:draw, :draw]

    in [Rock, Paper]
      [:lose, :win]
    in [Rock, Scissors]
      [:win, :lose]

    in [Paper, Rock]
      [:win, :lose]
    in [Paper, Scissors]
      [:lose, :win]

    in [Scissors, Rock]
      [:lose, :win]
    in [Scissors, Paper]
      [:win, :lose]
    end
  end

  def outcome_for(key)
    @outcomes[key]
  end
end

Rock = Struct.new("Rock") do
  def score
    1
  end
end

Paper = Struct.new("Paper") do
  def score
    2
  end
end

Scissors = Struct.new("Scissors") do
  def score
    3
  end
end
