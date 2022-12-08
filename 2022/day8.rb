# frozen_string_literal: true

require "advent"

class Day8 < Advent::Solution
  def part1(input: load_input)
    trees = prepare(input)

    trees_transposed = trees.transpose
    forest = build_visible_forest(trees.size)

    trees.each_with_index do |row, y|
      next if y == 0 || y == (trees.size - 1)

      row.each_with_index do |tree, x|
        next if x == 0 || x == (row.size - 1)

        shorter = ->(other_tree) { other_tree < tree }

        visible_from_left = row[...x].all? shorter
        visible_from_right = row[(x + 1)..].all? shorter
        visible_from_above = trees_transposed[x][...y].all? shorter
        visible_from_below = trees_transposed[x][(y + 1)..].all? shorter

        if visible_from_left || visible_from_right || visible_from_above || visible_from_below
          forest[y][x] = 1
        end
      end
    end

    forest.flatten.sum
  end

  def part2(input: load_input)
    trees = prepare(input)

    trees_transposed = trees.transpose
    forest = build_scenic_forest(trees.size)

    trees.each_with_index do |row, y|
      next if y == 0 || y == (trees.size - 1)

      row.each_with_index do |tree, x|
        next if x == 0 || x == (row.size - 1)

        view_left = distance_till_blocked_view(row[...x].reverse, tree)
        view_right = distance_till_blocked_view(row[(x + 1)..], tree)
        view_above = distance_till_blocked_view(trees_transposed[x][...y].reverse, tree)
        view_below = distance_till_blocked_view(trees_transposed[x][(y + 1)..], tree)

        scenic_score = view_left * view_right * view_above * view_below
        forest[y][x] = scenic_score
      end
    end

    forest.flatten.max
  end

  private

  def prepare(input)
    input.split("\n").map do |line|
      line.chars.map(&:to_i)
    end
  end

  def build_visible_forest(size)
    forest = build_empty_forest(size)

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

  def build_empty_forest(size)
    Array.new(size) do
      Array.new(size, 0)
    end
  end

  def build_scenic_forest(size)
    build_empty_forest(size)
  end

  def distance_till_blocked_view(trees, tree)
    trees.reduce(0) do |distance, other_tree|
      if other_tree < tree
        distance + 1
      else
        return distance + 1
      end
    end
  end
end
