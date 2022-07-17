require 'rails_helper'

RSpec.describe 'ingredient show page' do

  it 'shows list of ingredients and number of recipes each ingredient is used in' do

    recipe_1 = Recipe.create!(name: "Spaghetti", complexity: 2, genre: "Italian")
    recipe_2 = Recipe.create!(name: "Pupusas", complexity: 3, genre: "El Salvadorian")
    recipe_3 = Recipe.create!(name: "Sandwich", complexity: 5, genre: "Tasty")

    pasta = Ingredient.create!(name: "Pasta", cost: 5)
    meat = Ingredient.create!(name: "Meat", cost: 10)
    cheese = Ingredient.create!(name: "Cheese", cost: 15)

    RecipeIngredient.create!(recipe: recipe_1, ingredient: pasta)
    RecipeIngredient.create!(recipe: recipe_1, ingredient: meat)
    RecipeIngredient.create!(recipe: recipe_1, ingredient: cheese)

    RecipeIngredient.create!(recipe: recipe_2, ingredient: meat)
    RecipeIngredient.create!(recipe: recipe_2, ingredient: cheese)

    RecipeIngredient.create!(recipe: recipe_3, ingredient: cheese)

    visit '/ingredients'

    expect(page).to have_content("Pasta: 1")
    expect(page).to have_content("Meat: 2")
    expect(page).to have_content("Cheese: 3")

  end

  it 'displays ingredients alphabetically' do

    recipe_1 = Recipe.create!(name: "Spaghetti", complexity: 2, genre: "Italian")
    recipe_2 = Recipe.create!(name: "Pupusas", complexity: 3, genre: "El Salvadorian")
    recipe_3 = Recipe.create!(name: "Sandwich", complexity: 5, genre: "Tasty")

    pasta = Ingredient.create!(name: "Pasta", cost: 5)
    meat = Ingredient.create!(name: "Meat", cost: 10)
    cheese = Ingredient.create!(name: "Cheese", cost: 15)

    RecipeIngredient.create!(recipe: recipe_1, ingredient: pasta)
    RecipeIngredient.create!(recipe: recipe_1, ingredient: meat)
    RecipeIngredient.create!(recipe: recipe_1, ingredient: cheese)

    RecipeIngredient.create!(recipe: recipe_2, ingredient: meat)
    RecipeIngredient.create!(recipe: recipe_2, ingredient: cheese)

    RecipeIngredient.create!(recipe: recipe_3, ingredient: cheese)

    visit '/ingredients'

    within '#ingredient-1' do
      expect(page).to have_content(cheese.name)
    end

    within '#ingredient-2' do
      expect(page).to have_content(meat.name)
    end

    within '#ingredient-3' do
      expect(page).to have_content(pasta.name)
    end
  end

end