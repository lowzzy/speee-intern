# frozen_string_literal: true

class CandidateBuyer < ApplicationRecord
  has_one :offer

  belongs_to :buy_contract, optional: true

  validates :name, presence: true
  validates :address, presence: true
  validates :hearing, presence: true
end
