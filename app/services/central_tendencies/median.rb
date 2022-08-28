# frozen_string_literal: true

module CentralTendencies
  class Median
    attr_accessor :data

    def initialize(data)
      self.data = data
    end

    def call
      result
    end

    private

    def result; end
  end
end
