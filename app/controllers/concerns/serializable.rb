# frozen_string_literal: true

module Serializable
  extend ActiveSupport::Concern

  def serialize(relation, serializer = nil)
    CollectionSerializer.new(relation, serializer)
  end
end
