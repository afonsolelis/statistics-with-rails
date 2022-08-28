# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MeansController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/means').to route_to('means#index')
    end

    it 'routes to #create' do
      expect(post: '/means').to route_to('means#create')
    end
  end
end
