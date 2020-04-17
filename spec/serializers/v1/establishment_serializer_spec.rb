require 'rails_helper'

describe V1::EstablishmentSerializer do
  let(:estab) { build(:establishment) }

  it do
    expect(
      V1::EstablishmentSerializer.new(estab).as_json
    ).to include(
      id: a_kind_of(Integer),
      name: a_kind_of(String),
      address: a_kind_of(String),
      number: a_kind_of(String),
      neighborhood: a_kind_of(String),
      city: a_kind_of(String),
      uf: a_kind_of(String),
      phone: a_kind_of(String),
      geocode: a_hash_including(
        lat: a_value, long: a_value
      )
    )
  end
end
