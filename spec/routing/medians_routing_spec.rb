# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MediansController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/medians').to route_to('medians#index')
    end

    it 'routes to #show' do
      expect(get: '/medians/1').to route_to('medians#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/medians').to route_to('medians#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/medians/1').to route_to('medians#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/medians/1').to route_to('medians#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/medians/1').to route_to('medians#destroy', id: '1')
    end
  end
end
