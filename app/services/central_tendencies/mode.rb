# frozen_string_literal: true

module CentralTendencies
  class Mode
    attr_accessor :data

    def initialize(data)
      self.data = data
    end

    def call
      result
    end

    private

    def result
      tallied = data.tally
      top_pair = tallied.sort_by { |_, v| v }.last(2)
      if top_pair.size == 1
        top_pair[0][0]
      elsif top_pair[0][1] == top_pair[1][1]
        nil
      else
        top_pair[1][0]
      end
    end
  end
end
