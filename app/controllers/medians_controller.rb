# frozen_string_literal: true

# Class to calculate the median of a set of numbers
class MediansController < ApplicationController
  def index
    render json: {
      message:         'Median is middle value of a set of numbers',
      payload_example: { data: 'array of integers or floats like: [1, 2, 3, 4, 5... n]' },
      all_requests:    Median.all
    }
  end

  def create
    begin
      result = CentralTendencies::Median.new(data_params).call
      Median.create!(received: data_params.to_s, result: result)
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
