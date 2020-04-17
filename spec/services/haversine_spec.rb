# frozen_string_literal: true

require 'rails_helper'

describe Haversine do
  describe '#distance' do
    it 'is expected to calculate correctly' do
      expect(
        Haversine.distance(
          -23.604936,        -46.692999,
          -23.6099946498864, -46.7057347297655
        )
      ).to eq(1.4143020957176993)
    end
  end
end
