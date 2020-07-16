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
end
