# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MeanDeviationsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/mean_deviations').to route_to('mean_deviations#index')
    end

    it 'routes to #create' do
      expect(post: '/mean_deviations').to route_to('mean_deviations#create')
    end
  end
end
