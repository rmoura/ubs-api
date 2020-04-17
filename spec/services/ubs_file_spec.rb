# frozen_string_literal: true

require 'rails_helper'

describe UbsFile do
  before do
    allow(Net::HTTP).to receive(:get).and_return(
      File.read(Rails.root.join('spec/support/sample_file.csv'))
    )
  end

  describe '#download' do
    it { expect(UbsFile.download).to be_a_kind_of(UbsFile) }
    it { expect(UbsFile.download).to have_attributes(path: start_with('/tmp/')) }
  end

  describe '#transform!' do
    subject { UbsFile.download.transform! }

    it { expect(subject).to be_a_kind_of(CSV::Table) }
    it { expect(subject.first).to be_a_kind_of(CSV::Row) }

    it 'is expected to convert header and values' do
      expect(subject.first[:lat]).to a_value
    end
  end
end
