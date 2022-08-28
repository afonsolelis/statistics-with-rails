# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MeansController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/means').to route_to('means#index')
    end

    it 'routes to #show' do
      expect(get: '/means/1').to route_to('means#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/means').to route_to('means#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/means/1').to route_to('means#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/means/1').to route_to('means#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/means/1').to route_to('means#destroy', id: '1')
    end
  end
end
