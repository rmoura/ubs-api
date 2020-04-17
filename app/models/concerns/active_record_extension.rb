# frozen_string_literal: true

module ActiveRecordExtension
  module Relation
    extend ActiveSupport::Concern

    module ClassMethods
      def update_or_create(unique_key, attributes)
        object = find_or_initialize_by(unique_key)
        return object if object.update!(attributes)
      end
    end
  end
end
