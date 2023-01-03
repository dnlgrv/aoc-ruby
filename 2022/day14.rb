# frozen_string_literal: true

require "advent"

class Day14 < Advent::Solution
  def part1(input: load_input)
    cavern = prepare(input)

    sand = [500, 0]
    cavern[sand] = "+"
    largest_y = cavern.keys.map(&:last).max

    until sand[1] > largest_y # falling infinitely
      new_sand = [sand[0], sand[1] + 1]
      unless cavern.has_key?(new_sand) # below is clear
        cavern.delete sand
        cavern[new_sand] = "+"
        sand = new_sand
        next
      end

      new_sand = [sand[0] - 1, sand[1] + 1]
      unless cavern.has_key?(new_sand) # down and left is clear
        cavern.delete sand
        cavern[new_sand] = "+"
        sand = new_sand
        next
      end

      new_sand = [sand[0] + 1, sand[1] + 1]
      unless cavern.has_key?(new_sand) # down and right is clear
        cavern.delete sand
        cavern[new_sand] = "+"
        sand = new_sand
        next
      end

      # sand has settled so reset
      sand = [500, 0]
      cavern[sand] = "+"
    end

    print_cavern cavern
    cavern.values.count { _1 == "+" } - 1 # the one that fell off
  end

  def part2(input: load_input)
  end

  private

  def print_cavern(cavern)
    smallest_x = cavern.keys.map(&:first).min
    largest_x = cavern.keys.map(&:first).max

    smallest_y = cavern.keys.map(&:last).min
    largest_y = cavern.keys.map(&:last).max

    print "\n"

    (smallest_y..largest_y).each do |y|
      (smallest_x..largest_x).each do |x|
        if cavern.has_key?([x, y])
          print cavern[[x, y]]
        else
          print "."
        end
      end

      print "\n"
    end
  end

  def prepare(input)
    cavern = {}

    input.lines(chomp: true).each do |line|
      line.split(" -> ").map do |rock|
        rock.split(",").map(&:to_i)
      end.each_cons(2).each do |(from, to)|
        from_x = (from[0] <= to[0]) ? from[0] : to[0]
        from_y = (from[1] <= to[1]) ? from[1] : to[1]
        to_x = (from[0] <= to[0]) ? to[0] : from[0]
        to_y = (from[1] <= to[1]) ? to[1] : from[1]

        from_x.upto(to_x).each do |x|
          cavern[[x, from_y]] = "#"
        end

        from_y.upto(to_y).each do |y|
          cavern[[from_x, y]] = "#"
        end
      end
    end

    cavern
  end
end
