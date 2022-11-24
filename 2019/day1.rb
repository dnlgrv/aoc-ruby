# frozen_string_literal: true

require "advent"

class Day1 < Advent::Solution
  def part1(input: load_input)
    prepare(input).sum do |mod|
      fuel_required mod
    end
  end

  def part2(input: load_input)
    prepare(input).sum do |mod|
      fuel_required_including_fuel mod
    end
  end

  private

  def fuel_required(mass)
    (mass / 3).floor - 2
  end

  def fuel_required_including_fuel(mass)
    mass_fuel = fuel_required mass
    return 0 if mass_fuel <= 0

    mass_fuel + fuel_required_including_fuel(mass_fuel)
  end

  def prepare(input)
    input.split.map(&:to_i)
  end
end
