# frozen_string_literal: true

json.extract! median, :id, :received, :response, :created_at, :updated_at
json.url median_url(median, format: :json)
