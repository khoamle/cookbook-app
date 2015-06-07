class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
  end

  def create
    @recipe = Recipe.create(title: params[:title], chef: params[:chef], ingredients: params[:ingredients], directions: params[:directions])
    flash[:success] = "Recipe sucessfully created!"
    redirect_to "/recipes/#{@recipe.id}" 
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
  end

  def edit
    @recipe = Recipe.find_by(id: params[:id])
  end

  def update
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.update(title: params[:title], chef: params[:chef], ingredients: params[:ingredients], directions: params[:directions])
    flash[:success] = "Recipe sucessfully created!"
    redirect_to "/recipes/#{@recipe.id}"
  end

  def destroy
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.destroy
    flash[:warning] = "Recipe sucessfully deleted!"
    redirect_to "/recipes"
  end

end
