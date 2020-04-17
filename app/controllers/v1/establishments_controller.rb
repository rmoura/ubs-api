# frozen_string_literal: true

module V1
  class EstablishmentsController < ApplicationController
    REGEX_VALID_AXIS = /\A[-+]?\d+(?:.\d+)?\Z/

    before_action :validate_coordinates, only: :show

    def show
      establishments = Establishment.order(
        'haversine(%f, %f, latitude, longitude)' % coordinates
      ).paginate(pagination_params)

      render json: serialize(establishments, EstablishmentSerializer), status: :ok
    end

    private

    def coordinates
      params[:query]&.split(',')
    end

    def validate_coordinates
      valid = coordinates.present? &&
              coordinates.size == 2 &&
              coordinates.all? { |point| point.match(REGEX_VALID_AXIS) }

      render json: { errors: 'Invalid coordinates!' },
             status: :unprocessable_entity unless valid
    end

    def pagination_params
      params.permit(:page, :per_page)
    end
  end
end
