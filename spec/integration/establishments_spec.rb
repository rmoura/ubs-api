require 'rails_helper'
require 'swagger_helper'

describe 'Establishments API' do
  path '/find_ubs?query={coordinates}&page={page}&per_page={per_page}' do
    get 'Find UBS' do
      tags 'Establishments'
      consumes 'application/json'
      parameter name: :coordinates, in: :path, type: :string
      parameter name: :per_page,    in: :path, type: :string
      parameter name: :page,        in: :path, type: :string

      response '200', 'Ordered establishments' do
        schema type: :object,
          properties: {
            current_page: { type: :integer, example: 1 },
            per_page: { type: :integer, example: 10 },
            total_entries: { type: :integer, example: 39767 },
            entries: {
              type: :array, example: [
                {
                  id: 1,
                  name: 'UBS REAL PQ PAULO MANGABEIRA',
                  address: 'RUA BARAO MELGACO',
                  number: 'S/N',
                  neighborhood: 'Centro',
                  city: 'São Paulo',
                  uf: 'SP',
                  phone: '011 37582329',
                  geocode: {
                    lat: -23.6099946498864,
                    long: -46.7057347297655
                  }
                }
              ]
            }
          }

        let(:coordinates) do
          estab = create(:establishment)
          [ estab.latitude, estab.longitude ] * ','
        end

        let(:per_page) { 1 }
        let(:page) { 1 }

        run_test!
      end

      response '422', 'Invalid request' do
        schema type: :object,
          properties: {
            errors: { type: :string, example: 'Invalid coordinates!' }
          }

        let(:per_page) { '' }
        let(:page) { '' }
        let(:coordinates) { '1abc,xyz' }

        run_test!
      end
    end
  end
end
