# frozen_string_literal: true

class Town < ApplicationRecord
  belongs_to :city, foreign_key: :city_id,
                    primary_key: :id,
                    inverse_of: :towns
end
