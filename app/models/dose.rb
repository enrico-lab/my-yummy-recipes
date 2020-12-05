class Dose < ApplicationRecord
  belongs_to :dish
  belongs_to :ingredient
  validates :description, presence: true
  validates :dish, presence: true
  validates :ingredient, presence: true, uniqueness: { scope: :dish }
end
