# frozen_string_literal: true

module CentralTendencies
  class MeanDeviation
    attr_accessor :data

    def initialize(data)
      self.data = data
    end

    def call
      result
    end

    private

    def result
      mean = CentralTendencies::Mean.new(data).call
      data.map { |value| (value - mean).abs }.sum / data.size
    end
  end
end
