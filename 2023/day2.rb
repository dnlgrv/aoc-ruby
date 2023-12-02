require "advent"

class Day2 < Advent::Solution
  def part1(input: load_input)
    max_red = 12
    max_green = 13
    max_blue = 14

    input.lines(chomp: true).each_with_object([]) do |line, possible|
      id, games = line.split ": "
      games = games.split "; "

      unless over_max?(games, "red", max_red) || over_max?(games, "green", max_green) || over_max?(games, "blue", max_blue)
        possible << id.delete_prefix("Game ").to_i
      end
    end.sum
  end

  def part2(input: load_input)
  end

  private

  def over_max?(games, colour, max)
    games.any? do |game|
      game.split(", ").any? do |pull|
        count, cube_colour = pull.split " "
        cube_colour == colour && count.to_i > max
      end
    end
  end
end
