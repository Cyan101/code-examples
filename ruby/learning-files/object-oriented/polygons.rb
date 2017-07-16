require 'matrix'

# Library
module Geo
    class Point
        attr_reader :x
        attr_reader :y

        def initialize(x = 0, y = 0)
            @x = x
            @y = y
      end

        def distance(other)
            (Vector[x, y] - Vector[other.x, other.y]).r
        end
    end

    class Line
        attr_reader :start
        attr_reader :finish

        def initialize(start, finish)
            @start = start
            @finish = finish
        end

        def length
            start.distance(finish)
        end
    end

    class Polygon
        attr_accessor :lines

        def initialize(lines = [])
            @lines = lines
        end

        def perimeter
            lines.collect(&:length).inject(0) { |a, e| a + e }
        end
    end
end

# Program
#-------
point = [
    Geo::Point.new(1.0, 2.0),
    Geo::Point.new(1.5, -2.5),
    Geo::Point.new(0.0, 2.0)
]

point_a = Geo::Point.new(0.0, 0.0)
point_b = Geo::Point.new(1.0, 2.0)

line = Geo::Line.new(point_a, point_b)

polygon = Geo::Polygon.new
# puts polygon.inspect
# puts polygon.lines.first.finish.y
polygon.lines << Geo::Line.new(Geo::Point.new(1.0, 4.0), Geo::Point.new(7.0, 10.0))
polygon.lines << Geo::Line.new(Geo::Point.new(2.0, 5.0), Geo::Point.new(8.0, 11.0))
polygon.lines << Geo::Line.new(Geo::Point.new(3.0, 6.0), Geo::Point.new(9.0, 13.0))
puts polygon.lines.map(&:inspect)

p polygon.perimeter
