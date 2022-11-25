# frozen_string_literal: true

require "advent"

class Day2 < Advent::Solution
  ADD = 1
  MULTIPLY = 2
  EXIT = 99

  def part1(input: load_input, noun: 12, verb: 2)
    memory = prepare input

    if noun && verb
      memory[1] = noun
      memory[2] = verb
    end

    program = memory.to_enum

    loop do
      instruction = program.next
      break if instruction == EXIT

      value, address = case instruction
      when ADD
        instruction_parameters(program, memory) do |a, b|
          a + b
        end

      when MULTIPLY
        instruction_parameters(program, memory) do |a, b|
          a * b
        end
      end

      memory[address] = value
    end

    memory[0]
  end

  def part2(input: load_input)
    nouns = (0..99).to_a
    verbs = (0..99).to_a

    combinations = (nouns.repeated_combination(2) + verbs.repeated_combination(2)).uniq.to_a

    combinations.each do |(noun, verb)|
      result = part1(input: input, noun: noun, verb: verb)

      if result == 19690720
        return 100 * noun + verb
      end
    end
  end

  private

  def prepare(input)
    input.split(",").map(&:to_i)
  end

  def instruction_parameters(program, memory, &block)
    address_a, address_b, output_address = program.next, program.next, program.next

    value = yield memory[address_a], memory[address_b]

    [value, output_address]
  end
end
