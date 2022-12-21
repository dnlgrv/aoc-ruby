# frozen_string_literal: true

require "advent"

class Day21 < Advent::Solution
  def part1(input: load_input)
    monkeys = prepare(input)

    calculate monkeys, "root"
  end

  def part2(input: load_input)
  end

  private

  def calculate(monkeys, key)
    value = monkeys[key]
    return value if value.is_a? Integer

    term_a = calculate monkeys, value[0]
    term_b = calculate monkeys, value[2]

    case value[1]
    when "+"
      term_a + term_b
    when "-"
      term_a - term_b
    when "*"
      term_a * term_b
    when "/"
      term_a / term_b
    end
  end

  def prepare(input)
    input.lines(chomp: true).map do |line|
      key, value = line.split(": ")

      if value.match?(/\d+/)
        [key, value.to_i]
      else
        [key, value.split]
      end
    end.to_h
  end
end
