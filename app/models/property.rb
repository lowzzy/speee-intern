# frozen_string_literal: true

class Property < ApplicationRecord
  enum construction_type: { house: 0, condominium: 1, apartment: 2 }
  enum material_type: { wooden: 0, rebar: 1 }

  validates  :prefecture, presence: true, inclusion: { in: 1..47 }
  validates  :city, presence: true
  validates  :station, presence: true
  validates  :age, numericality: { greater_than: 0 }, allow_blank: true
  validates  :floor_plan, format: { with: /\A[a-zA-Z]+\z/ }, allow_blank: true # 英数字
  validates  :square_measure, numericality: { greater_than: 0 }, allow_blank: true
  validates  :construction_type, numericality: { in: 0..2 }, allow_blank: true
  validates  :material_type, numericality: { in: 0..1 }, allow_blank: true
end
