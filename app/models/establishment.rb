# frozen_string_literal: true

class Establishment < ApplicationRecord
  include ActiveRecordExtension::Relation
  include Paginatable

  validates :cnes_id, :latitude, :longitude, :city, :uf, presence: true
  validates :cnes_id, uniqueness: true
  validates :latitude, :longitude, numericality: true
end
