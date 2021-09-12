# frozen_string_literal: true

class Agency < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true
  validates :tel, presence: true
end
