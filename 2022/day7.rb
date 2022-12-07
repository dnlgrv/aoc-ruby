# frozen_string_literal: true

require "advent"

class Day7 < Advent::Solution
  def part1(input: load_input)
    input = prepare(input).to_enum

    fs = build_filesystem input
    fs.recalculate!

    fs.values.filter do |size|
      size <= 100000
    end.sum
  end

  def part2(input: load_input)
    input = prepare(input).to_enum

    fs = build_filesystem input
    fs.recalculate!

    total_space = 70000000
    free_space = total_space - fs[Pathname.new("/")]

    space_required = 30000000
    amount_required_to_free = space_required - free_space

    fs.values.filter do |size|
      size >= amount_required_to_free
    end.min
  end

  class FileSystem < Hash
    extend Forwardable
    delegate :inspect => :@storage, :[] => :@storage, :[]= => :@storage, :values => :@storage

    attr_accessor :pwd

    def initialize
      @storage = Hash.new(0)
      @pwd = nil
    end

    def cd(path)
      @pwd = if @pwd.nil?
        Pathname.new(path)
      else
        @pwd.join(path)
      end
    end

    def filesize(size)
      @storage[@pwd] += size
    end

    def recalculate!
      @storage.each do |path, total|
        path.ascend do |parent|
          unless path == parent
            @storage[parent] += total
          end
        end
      end
    end
  end

  private

  def prepare(input)
    input.split("\n")
  end

  def build_filesystem(input)
    fs = FileSystem.new

    loop do
      line = input.next

      case line
      in /\$ cd (.*)$/
        fs.cd line.split(" ").last

      in /\$ ls$/
        until input.peek.start_with?("$")
          size, _ = input.next.split(" ")

          if size == "dir"
            fs.filesize 0
          else
            fs.filesize size.to_i
          end
        end
      end
    end

    fs
  end
end
