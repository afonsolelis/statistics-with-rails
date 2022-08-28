# frozen_string_literal: true

class Mean < ApplicationRecord
  validates :received, presence: true
  validates :result, presence: true
end
