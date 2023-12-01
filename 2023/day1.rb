# frozen_string_literal: true

require "advent"
require "debug"

class Day1 < Advent::Solution
  def part1(input: load_input)
    numbers = []

    input.lines(chomp: true).each do |line|
      first_digit = line.chars.find do |c|
        digits.include? c
      end

      last_digit = line.chars.reverse.find do |c|
        digits.include? c
      end

      numbers << "#{first_digit}#{last_digit}".to_i
    end

    numbers.sum
  end

  def part2(input: load_input)
  end

  private

  def digits
    ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
  end
end
