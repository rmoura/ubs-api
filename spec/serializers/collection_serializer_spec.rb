require 'rails_helper'

describe CollectionSerializer do
  before  { create(:establishment) }
  subject { CollectionSerializer.new(Establishment.paginate, serializer) }

  context 'with serializer' do
    let(:serializer) { V1::EstablishmentSerializer }

    it do
      expect(subject.as_json).to include(
        current_page: a_kind_of(Integer),
        per_page: a_kind_of(Integer),
        total_entries: a_kind_of(Integer),
        entries: a_kind_of(ActiveModelSerializers::SerializableResource)
      )
    end

    it do
      expect(subject).to have_attributes(serializer: V1::EstablishmentSerializer)
    end
  end

  context 'without serializer' do
    let(:serializer) { nil }

    it do
      expect(subject.as_json).to include(
        current_page: a_kind_of(Integer),
        per_page: a_kind_of(Integer),
        total_entries: a_kind_of(Integer),
        entries: a_kind_of(ActiveModelSerializers::SerializableResource)
      )
    end

    it { expect(subject).to have_attributes(serializer: nil) }
  end
end
