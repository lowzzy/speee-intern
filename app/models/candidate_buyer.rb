class CandidateBuyer < ApplicationRecord
  include ActiveRecord::AttributeAssignment
  has_one :offer

  validates :name, presence: true
  validates :address, presence: true
  validates :hearing, presence: true
end
