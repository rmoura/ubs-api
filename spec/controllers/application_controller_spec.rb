# frozen_string_literal: true

require 'rails_helper'

describe ApplicationController do
  context 'when page not found' do
    describe '#not_found', type: :request do
      before { get '/blah' }

      it { expect(response).to have_http_status(:not_found) }
      it { expect(response.body).to include('API endpoint Not Found!') }
    end
  end
end
