# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Mean, type: :model do
  it 'must create with valid attributes' do
    Mean.create!(received: [1, 2, 3, 4, 5, 6, 7, 8, 9].to_s, result: 5)
    expect(Mean.count).to eq(1)
  end

  it 'must have a received attribute' do
    expect do
      Mean.create!(result: 5)
    end.to raise_error(ActiveRecord::RecordInvalid)
  end
end
