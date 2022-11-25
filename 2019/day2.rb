# frozen_string_literal: true

require "advent"

class Day2 < Advent::Solution
  ADD = 1
  MULTIPLY = 2
  EXIT = 99

  def part1(input: load_input, solve: true)
    memory = prepare input

    if solve
      memory[1] = 12
      memory[2] = 2
    end

    program = memory.each_with_index

    loop do
      instruction, index = program.next
      break if instruction == EXIT

      value, address = case instruction
      when ADD
        instruction_parameters(memory, index) do |a, b|
          a + b
        end

      when MULTIPLY
        instruction_parameters(memory, index) do |a, b|
          a * b
        end
      end

      memory[address] = value
      3.times { program.next }
    end

    memory[0]
  end

  def part2(input: load_input)
  end

  private

  def prepare(input)
    input.split(",").map(&:to_i)
  end

  def instruction_parameters(memory, index, &block)
    address_a, address_b, output_address = memory[index + 1..index + 3]

    value = yield memory[address_a], memory[address_b]

    [value, output_address]
  end
end
