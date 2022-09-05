# frozen_string_literal: true

class Audit < ApplicationRecord
  STATISTICS = %w[mean median mode].freeze
  
  validates :received, presence: true
  validates :result, presence: true
  validates :statistic, presence: true, inclusion: { in: STATISTICS }
end
