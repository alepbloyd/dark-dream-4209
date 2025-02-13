class RecipesController < ApplicationController
  
  def index
    @recipes = Recipe.order(:name)
  end

  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.ingredients
    @total_cost = @recipe.total_cost
  end

end