class Api::RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
    render "index.json.jb"
  end

  def show
    # .find method takes in just an id (as opposed to .find_by which takes in a key value pairing)
    @recipe = Recipe.find(params[:id])
    render "show.json.jb"
  end

end