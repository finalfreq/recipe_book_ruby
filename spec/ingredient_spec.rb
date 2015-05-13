require 'spec_helper'

describe Recipe do

  it('shows ingredients belong to a recipe') do
    miso_soup = Recipe.create(name: "miso soup")
    tofu = Ingredient.create(name: "tofu")
    egg_white = Ingredient.create(name: "egg whites")
    miso_soup.update(ingredient_ids: [tofu.id, egg_white.id])
    expect(miso_soup.ingredients).to(eq([tofu, egg_white]))
  end
end
