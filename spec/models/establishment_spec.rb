# frozen_string_literal: true

require 'rails_helper'

describe Establishment do
  describe 'validations' do
    let(:establishment) { build(:establishment) }

    it { is_expected.to validate_presence_of(:cnes_id) }
    it { is_expected.to validate_presence_of(:latitude) }
    it { is_expected.to validate_presence_of(:longitude) }
    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_presence_of(:uf) }

    it { is_expected.to validate_numericality_of(:latitude) }
    it { is_expected.to validate_numericality_of(:longitude) }

    it { expect(establishment).to validate_uniqueness_of(:cnes_id) }
  end
end
