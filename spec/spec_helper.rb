ENV['RACK_ENV'] = 'test'

require 'bundler/setup'
Bundler.require :default,:test
set(:root, Dir.pwd())
Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }

require('capybara/rspec')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
require('./app')

RSpec.configure do |config|
  config.before(:each) do
    Ingredient.all().each() do |ingredient|
      ingredient.destroy()
    end
    Recipe.all().each() do |recipe|
      recipe.destroy()
    end
  end
  config.after(:each) do
    Ingredient.all().each() do |ingredient|
      ingredient.destroy()
    end
    Recipe.all().each() do |recipe|
      recipe.destroy()
    end
  end
end
