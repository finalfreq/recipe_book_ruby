require 'bundler/setup'
Bundler.require(:default)
require 'pry'
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }



get '/' do
  @recipes = Recipe.all
  erb(:index)
end

get '/recipes' do
  @recipes = Recipe.all
  erb :recipes
end

get '/recipes/new' do
  erb :add_recipe
end

post '/recipes' do
  recipe_name = params['recipe_name']
  recipe_instructions = params['instructions']
  recipe_ingredients = [params['ingredient1'], params['ingredient2'],params['ingredient3'],params['ingredient4']]
  the_recipe = Recipe.create(name: recipe_name)
  Instruction.create(description: recipe_instructions, recipe_id: the_recipe.id)
  ingredients = []
  ingredient_ids = []
  recipe_ingredients.each() do |ingredient|
    ingredients.push(Ingredient.create(name: ingredient)) if ingredient.length > 0
  end
  ingredients.each do |ingredient|
    ingredient_ids.push(ingredient.id)
  end
  the_recipe.update(ingredient_ids: ingredient_ids )
  @recipes = Recipe.all
  erb :recipes
end
