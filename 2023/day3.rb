require "advent"

class Day3 < Advent::Solution
  def part_1(input: input_text)
    parts = []

    grid = input.lines(chomp: true).map do |line|
      line.chars << "." # pad with extra column
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
  end
end
