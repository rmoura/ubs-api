class ApplicationController < ActionController::API
  include Serializable

  def not_found
    render json: { errors: 'API endpoint Not Found!' }, status: :not_found
  end
end
