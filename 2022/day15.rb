# frozen_string_literal: true

require "advent"

class Day15 < Advent::Solution
  ARBITRARY_NUMBER = 10_000_000

  def part1(input: load_input, y: 2_000_000)
    sensor_positions, beacon_positions = prepare(input)

    sensors = Set.new sensor_positions
    beacons = Set.new beacon_positions

    # Check along an arbirtarily long X axis at the Y position for any sensor
    # ranges that include that XY position.
    excluded = Set.new
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

  def part2(input: load_input, max_xy: 4_000_000)
    sensor_positions, _ = prepare(input)
    sensors = Set.new sensor_positions

    # Gather all the edges around each sensor's region. There will be overlaps
    # with regions from other sensors, leaving only 1 open space remaining.
    edges = Set.new
    sensors.each do |sensor, distance|
      edges.merge edge_points_around(sensor, distance + 1, max_xy)
    end

    excluded = Set.new
    edges.each do |edge|
      sensors.each do |sensor, distance|
        if manhattan_distance(edge, sensor) <= distance
          excluded << edge
        end
      end
    end

    x, y = (edges - excluded).first
    x * 4_000_000 + y
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

  def edge_points_around(point, distance, max_xy)
    x, y = point

    (-distance).upto(distance).flat_map do |dx|
      dy = distance - dx.abs
      points = []

      if x + dx >= 0 && x + dx <= max_xy # within x bounds
        if y + dy >= 0 && y + dy <= max_xy # within y bounds
          points << [x + dx, y + dy]
        end

        if y - dy >= 0 && y - dy <= max_xy # within y bounds
          points << [x + dx, y - dy]
        end
      end

      points
    end
  end
end
