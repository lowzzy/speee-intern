class Offer < ApplicationRecord
  # include ActiveRecord::AttributeAssignment
  # attribute :transacted_on, :datetime

  belongs_to :candidate_buyer
end
