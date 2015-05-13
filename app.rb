require 'bundler/setup'
Bundler.require(:default)

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
