class Ingredient < ApplicationRecord
  has_many :recipe_ingredients

  def recipe_count
  end

end