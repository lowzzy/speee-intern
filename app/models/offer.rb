# frozen_string_literal: true

class Offer < ApplicationRecord
  belongs_to :candidate_buyer
  belongs_to :user

  validates :price, presence: true
  validates :transacted_on, presence: true
end
