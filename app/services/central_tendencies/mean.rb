# frozen_string_literal: true

module CentralTendencies
  class Mean
    attr_accessor :data

    def initialize(data:)
      self.data = data
    end

    def call
      ActiveRecord::Base.transaction do
        response = result
        response
      end
    end

    private

    def result
      check_data
      data.sum.to_f / data.count
    end

    def check_data
      raise StandardError, 'This is not an array' if data.class != Array

      check_integers
    end

    def check_integers
      data.each do |i|
        raise StandardError, 'The array must have only decimals or integers' if i.class.equal?(String)
      end
    end
  end
end
