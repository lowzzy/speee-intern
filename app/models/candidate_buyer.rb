# frozen_string_literal: true

class CandidateBuyer < ApplicationRecord
  has_one :offer

  validates :name, presence: true
  validates :address, presence: true
  validates :hearing, presence: true
end
