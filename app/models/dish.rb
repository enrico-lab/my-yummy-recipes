class Dish < ApplicationRecord
  validates :name, presence: true
  validetes :description, presence: true
  has_one_attached :photo
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
end
