class Recipe < ActiveRecord::Base

  has_and_belongs_to_many :ingredients
  has_many :instructions
  has_and_belongs_to_many :categories

  before_save :normalize_name

  private
    def normalize_name
      self.name = name.downcase.titleize
    end
end
