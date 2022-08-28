# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MediansController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/medians').to route_to('medians#index')
    end

    it 'routes to #create' do
      expect(post: '/medians').to route_to('medians#create')
    end
  end
end
