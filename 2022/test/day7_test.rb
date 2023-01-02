# frozen_string_literal: true

require "advent"
require "minitest/autorun"

require_relative "../day7"

class Day7Test < Advent::TestCase
  INPUT = DATA.read

  def setup
    @solution = Day7.new
  end

  def test_part1
    assert_equal 95437, @solution.part1(input: INPUT)
  end

  def test_part2
    assert_equal 24933642, @solution.part2(input: INPUT)
  end
end

__END__
$ cd /
$ ls
dir a
14848514 b.txt
8504156 c.dat
dir d
$ cd a
$ ls
dir e
29116 f
2557 g
62596 h.lst
$ cd e
$ ls
584 i
$ cd ..
$ cd ..
$ cd d
$ ls
4060174 j
8033020 d.log
5626152 d.ext
7214296 k
