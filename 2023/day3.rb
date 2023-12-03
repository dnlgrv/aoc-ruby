require "advent"
require "debug"

class Day3 < Advent::Solution
  def part_1(input: input_text)
    parts = []

    grid = input.lines(chomp: true).map do |line|
      # pad with extra column
      line.chars << "."
    end

    # pad with extra rows
    grid.push Array.new(grid[0].size, ".")
    grid.unshift Array.new(grid[0].size, ".")

    grid.each.with_index do |line, row_index|
      number = []

      line.each_with_index do |char, column_index|
        if char.match /[0-9]/
          number << char
        elsif number.any?
          start_of_number = column_index - number.size
          end_of_number = column_index - 1

          # look around the number
          (start_of_number..end_of_number).each do |number_index|
            above_left = grid[row_index - 1][number_index - 1]
            above = grid[row_index - 1][number_index]
            above_right = grid[row_index - 1][number_index + 1]
            left = grid[row_index][number_index - 1]
            below_left = grid[row_index + 1][number_index - 1]
            below = grid[row_index + 1][number_index]
            below_right = grid[row_index + 1][number_index + 1]
            right = grid[row_index][number_index + 1]

            if [above_left, above, above_right, left, below_left, below, below_right, right].any? { _1 =~ /[^0-9\.]/ }
              parts << number.join
              break
            end
          end

          number = []
        end
      end
    end

    parts.map(&:to_i).sum
  end

  def part_2(input: input_text)
    line_length = input.lines.first.length - 1

    numbers = {}

    input.gsub(/\n/, "").scan(/[0-9]+/) do |match|
      range_start, range_end = $~.offset(0)
      numbers[(range_start...range_end)] = match
    end

    ratios = []

    input.gsub(/\n/, "").scan /\*/ do
      index = $~.offset(0).first

      above = index - line_length
      above_right = index - line_length + 1
      right = index + 1
      below_right = index + line_length + 1
      below = index + line_length
      below_left = index + line_length - 1
      left = index - 1
      above_left = index - line_length - 1

      gears = [above, above_right, right, below_right, below, below_left, left, above_left].inject([]) do |matching, around_index|
        if gear = numbers.select { _1 === around_index }
          matching << gear 
        end
      end.select { _1.any? }.uniq { _1.keys.first }.flat_map { _1.values }

      if gears.size == 2
        ratios << gears.map(&:to_i).inject(:*)
      end
    end

    ratios.sum
  end
end
