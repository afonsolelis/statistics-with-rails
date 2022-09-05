# frozen_string_literal: true

class Audit < ApplicationRecord
  STATISTICS = %w[mean median mode mean_deviation].freeze

  validates :received, presence: true
  validates :result, presence: true
  validates :statistic, presence: true, inclusion: { in: STATISTICS }
end
