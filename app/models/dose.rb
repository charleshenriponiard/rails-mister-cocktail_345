class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

  validates :description, presence: true
  validates_uniqueness_of :cocktail, :ingredient, scope: [:cocktail_id, :ingredient_id]
end
