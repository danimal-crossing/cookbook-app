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

  def create
    @recipe = Recipe.new(
      title: params[:title],
      chef: params[:chef],
      ingredients: params[:ingredients],
      directions: params[:directions],
      prep_time: params[:prep_time],
      image_url: params[:image_url]
    )
    @recipe.save
    render "show.json.jb"
  end

end