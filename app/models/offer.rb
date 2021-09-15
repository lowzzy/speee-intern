class Offer < ApplicationRecord
  belongs_to :candidate_buyer

  validates :price, presence: true
  validates :transacted_on, presence: true
end
