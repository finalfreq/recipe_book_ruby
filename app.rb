require 'bundler/setup'
Bundler.require(:default)
require 'pry'
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }



get '/' do
  @recipes = Recipe.all
  erb :index
end

get '/recipes' do
  @recipes = Recipe.all
  erb :recipes
end

get '/recipes/:id' do
  if params['id'] == 'new'
    erb :add_recipe
  else
    @recipe = Recipe.find(params['id'])
    @ingredients = @recipe.ingredients
    @instructions = @recipe.instructions.first
    @recipe_categories = @recipe.categories
    @categories = Category.all
    erb :recipe
  end
end

patch '/recipes/:id' do
  recipe = Recipe.find(params['id'])
  categories = Category.find(params['category_ids'])
  categories.each do |category|
    recipe.categories.push(category)
  end
  redirect to "/recipes/#{recipe.id}"
end


get '/recipes/new' do
  @categories = Category.all
  erb :add_recipe
end

post '/recipes' do
  recipe_name = params['recipe_name']
  recipe_instructions = params['instructions']
  recipe_ingredients = [params['ingredient1'], params['ingredient2'],params['ingredient3'],params['ingredient4']]
  the_recipe = Recipe.create(name: recipe_name)
  Instruction.create(description: recipe_instructions, recipe_id: the_recipe.id)
  ingredients = []
  recipe_ingredients.each() do |ingredient|
    if ingredient.length > 0
      ingredient1 = (Ingredient.create(name: ingredient))
      ingredients.push(ingredient1.id)
    end
  end
  the_recipe.update(ingredient_ids: ingredients )
  redirect to '/recipes'
end

get '/categories' do
  @categories = Category.all
  erb :categories
end

post '/categories' do
  Category.create(name: params['category_name'])
  redirect to '/categories'
end

get '/category/:id' do
  @category = Category.find(params['id'])
  @category_recipes = @category.recipes
  @recipes = Recipe.all
  erb :category
end

patch '/category/:id' do
  category = Category.find(params['id'])
  recipes = Recipe.find(params['recipe_ids'])
  recipes.each do |recipe|
    category.recipes.push(recipe)
  end
  redirect to "/category/#{category.id}"
end
