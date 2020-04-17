# frozen_string_literal: true

class CreateEstablishments < ActiveRecord::Migration[6.0]
  def change
    create_table :establishments do |t|
      t.serial  :cnes_id,   index: { unique: true },               null: false
      t.numeric :latitude,  index: true, precision: 15, scale: 13, null: false
      t.numeric :longitude, index: true, precision: 15, scale: 13, null: false
      t.string  :name
      t.string  :address
      t.string  :number
      t.string  :neighborhood
      t.string  :city,                                             null: false
      t.string  :uf,                                               null: false
      t.string  :phone

      t.timestamps
    end
  end
end
