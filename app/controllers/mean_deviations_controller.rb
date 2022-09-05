# frozen_string_literal: true

class MeanDeviationsController < ApplicationController
  # rubocop:disable Layout/LineLength
  def index
    render json: {
      message:         'How far, on average, all values are from the middle(mean).',
      payload_example: { data: 'array of integers or floats like: [1, 2, 3, 4, 5... n]' },
      all_requests:    Audit.where(statistic: 'mean_deviation').order(created_at: :desc)
    }
  end
  # rubocop:enable Layout/LineLength

  def create
    begin
      result = CentralTendencies::MeanDeviation.new(data_params).call
      Audit.create!(received: data_params.to_s, result: result, statistic: 'mean')
      render json: { result: result }, status: :created
    rescue StandardError => e
      render json: { error: e.message }, status: :unprocessable_entity
    end
  end

  private

  def data_params
    params.require(:data)
  end
end
