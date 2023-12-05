require "advent"
require "debug"

class Day4 < Advent::Solution
  def part_1(input: input_text)
    input.lines(chomp: true).map do |card|
      winning_numbers, your_numbers = card.sub(/Card.*: /, "").split(" | ").map do |numbers|
        numbers.split.map(&:to_i)
      end

      matches = winning_numbers.intersection your_numbers

      matches.inject(0) do |count|
        if count == 0
          1
        else
          count * 2
        end
      end
    end.sum
  end

  def part_2(input: input_text)
    cards = input.lines(chomp: true).map do |card|
      _, card, winning_numbers, _, your_numbers = card.split(/(Card.*: | \| )/)
        
      winning_numbers, your_numbers = [winning_numbers, your_numbers].map do |numbers|
        numbers.split.map(&:to_i)
      end

      [card.delete_suffix(": "), [winning_numbers, your_numbers]]
    end

    cards_hash = Hash[*cards.flatten(1)]
    count_cards cards_hash, cards_hash.keys, cards_hash.size
  end

  private
    def count_cards(all_cards, cards, total)
      copies = []

      cards.each do |card|
        winning, yours = all_cards[card]
        matches = winning.intersection(yours).size

        extras = all_cards.select do |c|
          card_number(c).between? card_number(card) + 1, card_number(card) + matches
        end

        copies.push *extras.map(&:first)
      end

      if copies.empty?
        total
      else
        count_cards all_cards, copies, (total + copies.size)
      end
    end

    def card_number(card)
      card.split.last.to_i
    end
end
