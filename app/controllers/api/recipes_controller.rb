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

  def update
    # find recipe by id
    @recipe = Recipe.find_by(id: params[:id])
    # update attributes using attribute writer(s)
    @recipe.title = params[:title] || @recipe.title
    @recipe.chef = params[:chef] || @recipe.chef
    @recipe.ingredients = params[:ingredients] || @recipe.ingredients
    @recipe.directions = params[:directions] || @recipe.directions
    @recipe.prep_time = params[:prep_time] || @recipe.prep_time
    @recipe.image_url = params[:image_url] || @recipe.image_url
    # save recipe
    @recipe.save
    # render a view
    render "show.json.jb"
  end

end