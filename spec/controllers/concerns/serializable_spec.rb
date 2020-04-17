require 'rails_helper'

describe Serializable do
  subject { Class.new(V1::EstablishmentsController) { extend Serializable } }

  describe '#serialize' do
    it do
      expect(
        subject.serialize(Establishment.paginate)
      ).to be_a_kind_of(CollectionSerializer)
    end
  end
end
