 describe 'the recipe path', type: :feature do
   before do
     visit '/'
     click_on 'add_recipe'
     fill_in 'recipe_name', with: 'toMato soUp'
     fill_in 'instructions', with: 'These are the instructions, they are great.'
     click_on 'submit_recipe'
   end
   it 'allows you to create a recipe' do
     expect(page).to have_content 'Tomato Soup'
   end
   it 'allows you to delete a recipe' do
     click_on 'Tomato Soup'
     click_on 'delete_recipe'
     expect(page).to_not have_content 'Tomato Soup'
   end
   it 'allows you to edit the recipe name' do
     click_on 'Tomato Soup'
     click_on 'edit_recipe'
     fill_in 'recipe_name', with: "HoT PoCKets"
     expect(page).to have_content 'Hot Pockets'
   end
 end
