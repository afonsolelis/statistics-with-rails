# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/medians', type: :request do
  let(:valid_attributes) do
    { received: [1, 2, 3, 4, 5, 6, 7, 8, 9], result: 5 }
  end

  let(:valid_attributes_2) do
    { received: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], result: 5.5 }
  end

  let(:invalid_attributes) do
    { received: nil }
  end

  let(:valid_headers) do
    { content_type: 'application/json' }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Median.create! valid_attributes
      get medians_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Median' do
        expect do
          post medians_url,
               params: { data: valid_attributes[:received] }, headers: valid_headers, as: :json
        end.to change(Median, :count).by(1)
      end

      it 'renders a JSON response with the new median' do
        post medians_url,
             params: { data: valid_attributes[:received] }, headers: valid_headers, as: :json
        expect(JSON.parse(response.body)["result"]).to eq(valid_attributes[:result])
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end

      it 'renders a JSON response with the new median' do
        post medians_url,
             params: { data: valid_attributes_2[:received] }, headers: valid_headers, as: :json
             expect(JSON.parse(response.body)["result"]).to eq(valid_attributes_2[:result])
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Median' do
        expect do
          post medians_url,
               params: { median: invalid_attributes }, as: :json
        end.to change(Median, :count).by(0)
      end

      it 'renders a JSON response with errors for the new median' do
        post medians_url,
             params: { median: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end
end
