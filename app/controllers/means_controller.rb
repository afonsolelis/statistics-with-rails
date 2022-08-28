# frozen_string_literal: true

# Class to calculate mean
class MeansController < ApplicationController
  # rubocop:disable Layout/LineLength
  def index
    render json: {
      message:         'Mean is an essential concept in mathematics and statistics. The mean is the average or the most common value in a collection of numbers.',
      payload_example: { data: 'array of integers or floats like: [1, 2, 3, 4, 5... n]' },
      all_requests:    Mean.all
    }
  end
  # rubocop:enable Layout/LineLength

  def create
    begin
      result = CentralTendencies::Mean.new(data_params).call
      Mean.create!(received: data_params.to_s, result: result)
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
