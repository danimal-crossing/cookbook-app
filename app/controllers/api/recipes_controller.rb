class Api::RecipesController < ApplicationController

  before_action :authenticate_user, except: [:index, :show]

  def index
    @recipes = Recipe.all
    # if params[:title]
    #   @recipes = Recipe.where("title iLIKE ?", "%#{params[:title]}%")
    # end
    # @recipes = @recipes.order(:id)
    render "index.json.jb"
  end

  def show
    # .find method takes in just an id (as opposed to .find_by which takes in a key value pairing)
    @recipe = Recipe.find(params[:id])
    render "show.json.jb"
    # render "show.html.erb"
  end

  def create
    @recipe = Recipe.new(
      title: params[:title],
      user_id: current_user.id,
      ingredients: params[:ingredients],
      directions: params[:directions],
      prep_time: params[:prep_time],
      image_url: params[:image_url]
    )
    if @recipe.save
      render "show.json.jb"
    else
      render json: {errors: @recipe.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def update
    # find recipe by id
    @recipe = Recipe.find_by(id: params[:id])

    if @recipe.user_id == current_user.id
      # update attributes using attribute writer(s)
      @recipe.title = params[:title] || @recipe.title
      @recipe.ingredients = params[:ingredients] || @recipe.ingredients
      @recipe.directions = params[:directions] || @recipe.directions
      @recipe.prep_time = params[:prep_time] || @recipe.prep_time
      @recipe.image_url = params[:image_url] || @recipe.image_url
      if @recipe.save
        render "show.json.jb"
      else
        render json: {errors: @recipe.errors.full_messages}, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.destroy
    render json: {message: "Recipe successfully destroyed!"}
  end

end