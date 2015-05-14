class Instruction < ActiveRecord::Base

  belongs_to :recipes
  validates(:description, length: {minimum: 15})

end
