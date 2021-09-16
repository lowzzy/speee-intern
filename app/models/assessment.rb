# frozen_string_literal: true

class Assessment < ApplicationRecord
  belongs_to :user
  belongs_to :property
  belongs_to :agency
end
