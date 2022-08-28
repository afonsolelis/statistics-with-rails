# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/means', type: :request do
  let(:valid_attributes) do
    { received: [1, 2, 3, 4, 5, 6, 7, 8, 9], result: 5 }
  end

  let(:invalid_attributes) do
    { received: [1, 2, 3, '4'], result: 10 }
  end

  let(:valid_headers) do
    { content_type: 'application-json' }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Mean.create! valid_attributes
      get means_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Mean' do
        expect do
          post means_url,
               params: { data: valid_attributes[:received] }, headers: valid_headers, as: :json
        end.to change(Mean, :count).by(1)
      end

      it 'renders a JSON response with the new mean' do
        post means_url,
             params: { data: valid_attributes[:received] }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end

      it 'can handle big arrays' do
        data_array = (1..100_000).to_a
        post means_url,
              params: { data: data_array }, headers: valid_headers, as: :json
              result = JSON.parse(response.body)
              expect(data_array.sum.to_f/data_array.size).to eq(result['result'])
              expect(response).to have_http_status(:created)
              expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Mean' do
        expect do
          post means_url,
               params: { data: invalid_attributes[:received] }, as: :json
        end.to change(Mean, :count).by(0)
      end

      it 'renders a JSON response with errors for the new mean' do
        post means_url,
             params: { data: invalid_attributes[:received] }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end
end
