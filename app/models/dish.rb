class Dish < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  has_one_attached :photo
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  belongs_to :user
end
