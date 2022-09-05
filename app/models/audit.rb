# frozen_string_literal: true

class Audit < ApplicationRecord
  STATISTICS = %w[means medians modes mean_deviations].freeze

  validates :received, presence: true
  validates :result, presence: true
  validates :statistic, presence: true, inclusion: { in: STATISTICS }
end
