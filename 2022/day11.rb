# frozen_string_literal: true

require "advent"

class Day11 < Advent::Solution
  def part1(input: load_input)
    monkeys = prepare(input).map do |args|
      Monkey.new(*args)
    end

    (1..20).each do |round|
      monkeys.each do |monkey|
        monkey.items.size.times do
          item = monkey.items.shift
          item = monkey.inspect_item item
          item = (item.to_f / 3).floor

          monkey.perform(item, monkeys)
        end
      end
    end

    monkey_a, monkey_b = monkeys.sort_by(&:inspections).reverse
    monkey_a.inspections * monkey_b.inspections
  end

  def part2(input: load_input)
    monkeys = prepare(input).map do |args|
      Monkey.new(*args)
    end

    all_divisors = monkeys.map(&:divisor).reduce(:*)

    (1..10_000).each do |round|
      monkeys.each do |monkey|
        monkey.items.size.times do
          item = monkey.items.shift
          item = monkey.inspect_item item
          item = item % all_divisors

          monkey.perform(item, monkeys)
        end
      end
    end

    monkey_a, monkey_b = monkeys.sort_by(&:inspections).reverse
    monkey_a.inspections * monkey_b.inspections
  end

  private

  def prepare(input)
    input.split("\n\n").map do |monkey|
      id, items, operation, tester, truthy, falsey = monkey.lines(chomp: true)

      [
        parse_id(id),
        parse_items(items),
        parse_operation(operation),
        parse_divisor(tester),
        parse_action(truthy, falsey)
      ]
    end
  end

  def parse_id(str)
    str.match(/(\d)/).captures.first.to_i
  end

  def parse_items(str)
    str.lstrip.sub("Starting items: ", "").split(", ").map(&:to_i)
  end

  def parse_operation(str)
    str.lstrip.sub("Operation: new = old ", "").split(" ").tap do |str|
      case str
      in ["*", "old"]
        return ->(old) { old * old }

      in ["+", "old"]
        return ->(old) { old + old }

      in ["*", number]
        return ->(old) { old * number.to_i }

      in ["+", number]
        return ->(old) { old + number.to_i }
      end
    end
  end

  def parse_divisor(str)
    str.lstrip.sub("Test: divisible by ", "").to_i
  end

  def parse_action(truthy, falsey)
    true_monkey = truthy.lstrip.split(" ").last.to_i
    false_monkey = falsey.lstrip.split(" ").last.to_i

    ->(item, monkeys) do
      if item % @divisor == 0
        throw_item item, to: monkeys[true_monkey]
      else
        throw_item item, to: monkeys[false_monkey]
      end
    end
  end
end

class Monkey
  attr_reader :id, :inspections, :items, :divisor

  def initialize(id, items, operation, divisor, action)
    @id = id
    @items = items
    @operation = operation
    @divisor = divisor
    @action = action

    @inspections = 0
  end

  def inspect_item(item)
    @inspections += 1
    @operation.call item
  end

  def perform(item, monkeys)
    instance_exec item, monkeys, &@action
  end

  def throw_item(item, to:)
    to.receive(item)
  end

  def receive(item)
    @items.push(item)
  end
end
