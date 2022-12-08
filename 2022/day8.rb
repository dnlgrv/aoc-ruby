# frozen_string_literal: true

require "advent"

class Day8 < Advent::Solution
  def part1(input: load_input)
    trees = prepare(input)

    trees_tranposed = trees.transpose
    forest = build_forest(trees.size)

    trees.each_with_index do |row, y|
      next if y == 0 || y == (trees.size - 1)

      row.each_with_index do |tree, x|
        next if x == 0 || x == (row.size - 1)

        visible_from_left = row[...x].all? { |other_tree| other_tree < tree }
        visible_from_right = row[(x + 1)..].all? { |other_tree| other_tree < tree }
        visible_from_above = trees_tranposed[x][...y].all? { |other_tree| other_tree < tree }
        visible_from_below = trees_tranposed[x][(y + 1)..].all? { |other_tree| other_tree < tree }

        if visible_from_left || visible_from_right || visible_from_above || visible_from_below
          forest[y][x] = 1
        end
      end
    end

    forest.flatten.sum
  end

  def part2(input: load_input)
  end

  private

  def prepare(input)
    input.split("\n").map do |line|
      line.chars.map(&:to_i)
    end
  end

  def build_forest(size)
    forest = Array.new(size) do
      Array.new(size, 0)
    end

    size.times.each do |row|
      size.times.each do |column|
        if row == 0 || row == size - 1
          forest[row][column] = 1
        end

        if column == 0 || column == size - 1
          forest[row][column] = 1
        end
      end
    end

    forest
  end
end
