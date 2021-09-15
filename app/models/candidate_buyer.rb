class CandidateBuyer < ApplicationRecord
  include ActiveRecord::AttributeAssignment
  has_one :offer
  validates :hearing, presence: true
end
