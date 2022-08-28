# frozen_string_literal: true

json.extract! mean, :id, :received, :result, :created_at, :updated_at
json.url mean_url(mean, format: :json)
