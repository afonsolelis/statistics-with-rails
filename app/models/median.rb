# frozen_string_literal: true

class Median < ApplicationRecord
  validates :received, presence: true
  validates :result, presence: true
end
