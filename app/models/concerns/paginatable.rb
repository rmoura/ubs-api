# frozen_string_literal: true

module Paginatable
  extend ActiveSupport::Concern

  included do
    scope :paginate, ->(args = {}) { page(args[:page]).per(args[:per_page]) }
  end
end
