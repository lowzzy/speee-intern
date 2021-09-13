# frozen_string_literal: true

class Prefecture < ApplicationRecord
  has_many :cities, foreign_key: :prefecture_id,
                    primary_key: :id,
                    inverse_of: :prefecture
end
