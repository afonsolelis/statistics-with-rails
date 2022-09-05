require 'rails_helper'

RSpec.describe Audit, type: :model do
  it 'must create with valid attributes' do
    Audit.create!(received: [1, 2, 3, 4, 5, 6, 7, 8, 9].to_s, result: 5, statistic: 'mode')
    expect(Audit.count).to eq(1)
  end

  it 'must have a received attribute' do
    expect do
      Audit.create!(result: 5)
    end.to raise_error(ActiveRecord::RecordInvalid)
  end

  it 'should not persist if statistic is out of list' do
    begin
      Audit.create!(received: [1, 2, 3, 4, 5, 6, 7, 8, 9].to_s, result: 5, statistic: 'xxx')
    rescue ActiveRecord::RecordInvalid => e
      expect(e.message).to eq('Validation failed: Statistic is not included in the list')
    end
  end
end
