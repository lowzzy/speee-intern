# frozen_string_literal: true

class City < ApplicationRecord
  belongs_to :prefecture, foreign_key: :prefecture_id,
                          primary_key: :id,
                          inverse_of: :cities
  has_many :towns, foreign_key: :city_id,
                   primary_key: :id,
                   inverse_of: :city
end
