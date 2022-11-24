# frozen_string_literal: true

require "advent"

class Day1 < Advent::Solution
  def part1(input: load_input)
    entries = prepare input

    entries.each do |entry|
      entries.each do |other_entry|
        if entry + other_entry == 2020
          return entry * other_entry
        end
      end
    end
  end

  def part2(input: load_input)
    entries = prepare input

    entries.each do |entry|
      entries.each do |other_entry|
        entries.each do |another_entry|
          if entry + other_entry + another_entry == 2020
            return entry * other_entry * another_entry
          end
        end
      end
    end
  end

  private

  def prepare(input)
    input.split.map(&:to_i)
  end
end
