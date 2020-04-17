# frozen_string_literal: true

# Calculation for distance between two points
# Reference: https://pt.wikipedia.org/wiki/F%C3%B3rmula_de_Haversine

class Haversine
  class << self
    include Math

    def distance(lat_from, long_from, lat_to, long_to)
      cosines = [ lat_from, lat_to, long_to - long_from ].map { |point| cos(point) }
      sines   = [ lat_from, lat_to ].map { |point| sin(point) }

      calc = [cosines, sines].map do |list|
        list.inject { |mem, item| mem *= item }
      end.sum

      6371 * acos(calc)
    end

    private

    def to_radian(point)
      point * PI / 180
    end

    def cos(point)
      super(to_radian(point))
    end

    def sin(point)
      super(to_radian(point))
    end
  end
end
