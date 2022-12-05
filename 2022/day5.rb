# frozen_string_literal: true

require "advent"

class Day5 < Advent::Solution
  def part1(input: load_input)
    ship, instructions = prepare(input)

    instructions.each_with_object(ship) do |instruction, ship|
      amount, from, to = instruction.match(/move ([0-9]+) from ([0-9]+) to ([0-9]+)/).captures

      amount.to_i.times do
        crate = ship[from].pop
        ship[to] << crate
      end

      ship
    end.map do |_, stack|
      stack.last
    end.join
  end

  def part2(input: load_input)
  end

  private

  def prepare(input)
    stacks, instructions = input.chomp.split("\n\n")

    [prepare_ship(stacks), prepare_instructions(instructions)]
  end

  def prepare_ship(input)
    parsed = input.split("\n").map do |line|
      line.scan(/(.{1,4})/).flat_map do |col|
        case col.first.strip
        in ""
          nil

        in /\[([A-Z])\]/ => match
          match[1]

        in /[1-9]/ => match
          match[0]
        end
      end
    end

    parsed[0].zip(*parsed[1..]).map(&:compact).map(&:reverse).each_with_object({}) do |(index, *crates), h|
      h[index] = crates
    end
  end

  def prepare_instructions(input)
    input.split("\n")
  end
end
