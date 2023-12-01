# frozen_string_literal: true

require "advent"
require "debug"

class Day1 < Advent::Solution
  def part1(input: load_input)
    input.lines(chomp: true).map do |line|
      first_digit = line.chars.find do |c|
        digits.include? c
      end

      last_digit = line.chars.reverse.find do |c|
        digits.include? c
      end

      "#{first_digit}#{last_digit}".to_i
    end.sum
  end

  def part2(input: load_input)
    input.lines(chomp: true).map do |line|
      results = line.scan /#{digits.join("|")}|#{more_digits.join("|")}/
      first_digit = if index = more_digits.find_index(results.first)
                      digits[index]
                    else
                      results.first
                    end

      results = line.scan /(?=(#{digits.join("|")}|#{more_digits.join("|")}))/
      last_digit = if index = more_digits.find_index(results.last.first)
                      digits[index]
                    else
                      results.last.first
                    end

      "#{first_digit}#{last_digit}".to_i
    end.sum
  end

  private

  def digits
    ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
  end

  def more_digits
    ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
  end
end
