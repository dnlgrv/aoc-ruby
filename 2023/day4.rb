require "advent"

class Day4 < Advent::Solution
  def part_1(input: input_text)
    input.lines(chomp: true).map do |card|
      winning_numbers, your_numbers = card.sub(/Card.*: /, "").split(" | ").map do |numbers|
        numbers.split.map(&:to_i)
      end

      matches = winning_numbers.intersection your_numbers

      matches.inject(0) do |count|
        if count == 0
          1
        else
          count * 2
        end
      end
    end.sum
  end

  def part_2(input: input_text)
  end
end
