require 'rails_helper'

RSpec.describe "Recipes", type: :request do
  before do
    user = User.create(name: "Cheddar", email: "cheddar@gmail.com", password: "password")
    Recipe.create(title: "Example Title 1", ingredients: "Example ingredients 1", directions: "Example directiosn 1", prep_time: 100, image_url: "Example image url 1", user_id: user.id)
    Recipe.create(title: "Example Title 2", ingredients: "Example ingredients 2", directions: "Example directiosn 2", prep_time: 200, image_url: "Example image url 2", user_id: user.id)
    Recipe.create(title: "Example Title 3", ingredients: "Example ingredients 3", directions: "Example directiosn 3", prep_time: 300, image_url: "Example image url 3", user_id: user.id)
  end

  describe "GET /recipes" do
    it "should return an array of recipes" do
      get "/api/recipes"
      recipes = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(recipes.length).to eq(3)
    end
  end
  describe "GET /recipes/:id" do
    it "should return a hash with the appropriate recipe attributes" do
      recipe_id = Recipe.first.id
      get "/api/recipes/#{recipe_id}"
      recipe = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(recipe["title"]).to eq("Example Title 1")
    end
  end
  describe "POST /recipes" do
    it "should create a new recipe" do
      user = User.first
      jwt = JWT.encode(
        {
          user_id: user.id, # the data to encode
        },
        Rails.application.credentials.fetch(:secret_key_base), # the secret key
        "HS256" # the encryption algorithm
      )
      post "/api/recipes", 
      params: {
        title: "New Title", 
        ingredients: "New Ingredients",
        directions: "New Directions",
        prep_time: 20,
        image_url: "New Image Url"
      },
      headers: { "Authorization" => "Bearer #{jwt}"}
      recipe = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(recipe["title"]).to eq("New Title")
    end
    it 'returns an error status code with an unauthorized user' do
      post "/api/recipes", 
      params: {
        title: "New Title", 
        ingredients: "New Ingredients",
        directions: "New Directions",
        prep_time: 20,
        image_url: "New Image Url"
      }
      expect(response).to have_http_status(401)
    end
    it 'returns an error status code with invalid data' do
      user = User.first
      jwt = JWT.encode(
        {
          user_id: user.id, # the data to encode
        },
        Rails.application.credentials.fetch(:secret_key_base), # the secret key
        "HS256" # the encryption algorithm
      )
      post "/api/recipes", 
      params: {
        title: "", 
        ingredients: "",
        directions: "",
        prep_time: 20,
        image_url: ""
      },
      headers: { "Authorization" => "Bearer #{jwt}"}
      recipe = JSON.parse(response.body)
      expect(response).to have_http_status(422)
    end
  end
end
