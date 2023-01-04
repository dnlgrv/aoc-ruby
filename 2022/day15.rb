# frozen_string_literal: true

require "advent"

class Day15 < Advent::Solution
  ARBITRARY_NUMBER = 10_000_000

  def part1(input: load_input, y: 2_000_000)
    sensor_positions, beacon_positions = prepare(input)

    sensors = Set.new sensor_positions
    beacons = Set.new beacon_positions

    excluded = Set.new

    # Check along an arbirtarily long X axis at the Y position for any sensor
    # ranges that include that XY position.
    (-ARBITRARY_NUMBER).upto(ARBITRARY_NUMBER).each do |x|
      point = [x, y]

      sensors.each do |sensor, distance|
        if manhattan_distance(point, sensor) <= distance && !beacons.member?(point)
          excluded << point
        end
      end
    end

    excluded.size
  end

  def part2(input: load_input)
  end

  private

  def prepare(input)
    input.lines(chomp: true).flat_map do |line|
      data = line.match(/Sensor at x=(-?\d+), y=(-?\d+): closest beacon is at x=(-?\d+), y=(-?\d+)/)
      sensor, beacon = [data[1..2].map(&:to_i), data[3..4].map(&:to_i)]

      sensor = [sensor, manhattan_distance(sensor, beacon)]

      [sensor, beacon]
    end.partition.with_index do |_, index|
      index % 2 == 0
    end
  end

  def manhattan_distance(a, b)
    (a[0] - b[0]).abs + (a[1] - b[1]).abs
  end
end
