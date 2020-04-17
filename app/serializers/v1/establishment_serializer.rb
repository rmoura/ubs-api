module V1
  class EstablishmentSerializer < ApplicationSerializer
    attributes :id, :name, :address, :number, :neighborhood,
               :city, :uf, :phone, :geocode

    def id
      object.cnes_id
    end

    def geocode
      {
        lat:  object.latitude,
        long: object.longitude
      }
    end
  end
end
