# frozen_string_literal: true

class BuyContract < ApplicationRecord
  belongs_to :user
  belongs_to :candidate_buyer
end
