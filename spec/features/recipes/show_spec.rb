require 'rails_helper'

RSpec.describe 'recipe show page' do

  it 'shows list of all ingredients for recipe' do
    recipe_1 = Recipe.create!(name: "Spaghetti", complexity: 2, genre: "Italian")

    pasta = recipe_1.ingredients.create!(name: "Pasta", cost: 5)
    meat = recipe_1.ingredients.create!(name: "Meat", cost: 10)
    cheese = recipe_1.ingredients.create!(name: "Cheese", cost: 15)

    visit "/recipes/#{recipe_1.id}"

    expect(page).to have_content(pasta.name)
    expect(page).to have_content(meat.name)
    expect(page).to have_content(cheese.name)
  end

end