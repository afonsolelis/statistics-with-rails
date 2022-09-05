# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ModesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/modes').to route_to('modes#index')
    end

    it 'routes to #create' do
      expect(post: '/modes').to route_to('modes#create')
    end
  end
end
