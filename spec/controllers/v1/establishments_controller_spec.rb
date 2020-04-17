# frozen_string_literal: true

require 'rails_helper'

describe V1::EstablishmentsController do
  before { create(:establishment) }

  describe 'GET #show' do
    context 'with empty params' do
      let(:response) { get :show }

      it { expect(response).to have_http_status :unprocessable_entity }
      it { expect(response.body).to include('Invalid coordinates!') }
    end

    context 'with invalid params' do
      let(:response) { get :show, params: { query: '1zy,0' } }

      it { expect(response).to have_http_status :unprocessable_entity }
      it { expect(response.body).to include('Invalid coordinates!') }
    end

    context 'with valid params' do
      let(:response) { get :show, params: { query: '1,0', page: 1, per_page: 1 } }
      let(:parsed_body) { JSON.parse(response.body, symbolize_names: true) }

      it { expect(response).to have_http_status :ok }

      it do
        expect(parsed_body).to include(
          current_page: 1,
          per_page: 1,
          total_entries: 1,
          entries: a_collection_containing_exactly(an_instance_of(Hash))
        )
      end
    end
  end
end
