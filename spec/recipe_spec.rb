require 'spec_helper'

describe Recipe do

  it('shows ingredients belong to a recipe') do
    miso_soup = Recipe.create(name: "miso soup")
    miso_soup_instructions = Instruction.create(description: "put it all in the pan", recipe_id: miso_soup.id)
    tofu = Ingredient.create(name: "tofu")
    egg_white = Ingredient.create(name: "egg whites")
    miso_soup.update(ingredient_ids: [tofu.id, egg_white.id])
    expect(miso_soup.instructions).to(eq([miso_soup_instructions]))
  end
end
