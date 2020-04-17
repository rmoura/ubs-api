# frozen_string_literal: true

require 'rails_helper'

describe ActiveRecordExtension::Relation do
  let(:estab) { create(:establishment) }

  describe '#update_or_create' do
    context 'on update existing record' do
      it 'is expected to update the record' do
        expect(
          Establishment.update_or_create(
            { cnes_id: estab.cnes_id }, { name: 'UBS Centro' }
          )
        ).to have_attributes(name: 'UBS Centro')
      end
    end

    context 'on create record does not exist' do
      it 'is expected to create the record' do
        expect(
          Establishment.update_or_create(
            { cnes_id: rand(1000..9999) },
            {
              name: 'UBS Tatuapé',
              city: 'São Paulo',
              uf:   'SP',
              latitude:  (Math::PI * rand).round(13),
              longitude: (Math::PI * rand).round(13)
            }
          )
        ).to have_attributes(name: 'UBS Tatuapé')
      end
    end
  end
end
