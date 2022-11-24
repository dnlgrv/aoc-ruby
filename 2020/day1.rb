# frozen_string_literal: true

require "advent"

class Day1 < Advent::Solution
  def part1(input: load_input)
    entries = prepare input

    entries.reduce(nil) do |result, entry|
      break result unless result.nil?

      pair = entries.find do |other_entry|
        entry + other_entry == 2020
      end

      entry * pair if pair
    end
  end

  def part2(input: load_input)
  end

  private

  def prepare(input)
    input.split.map(&:to_i)
  end
end
