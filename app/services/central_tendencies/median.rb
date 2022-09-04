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

    def result
      data.sort!
      if data.length.odd?
        data[data.count / 2]
      else
        (data[data.count / 2] + data[(data.count / 2) - 1]) / 2.0
      end
    end
  end
end
