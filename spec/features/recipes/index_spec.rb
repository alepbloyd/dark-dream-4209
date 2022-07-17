require 'rails_helper'

RSpec.describe 'recipe index page' do
  it 'lists all recipes with name, complexity, and genre' do

    recipe_1 = Recipe.create!(name: "Spaghetti", complexity: 2, genre: "Italian")

    recipe_2 = Recipe.create!(name: "Pupusas", complexity: 3, genre: "El Salvadorian")

    visit '/recipes'

    expect(page).to have_content(recipe_1.name)
    expect(page).to have_content(recipe_1.complexity)
    expect(page).to have_content(recipe_1.genre)

    expect(page).to have_content(recipe_2.name)
    expect(page).to have_content(recipe_2.complexity)
    expect(page).to have_content(recipe_2.genre)
  end
end