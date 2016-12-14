require('spec_helper')

describe('adding a recipe object', {:type => :feature}) do
  it('allows a user to create a new recipe with a name, ingredients and instructions') do
    visit('/')
    fill_in('recipe_name', :with => "Lulu Beansy")
    click_button('Create Recipe')
    fill_in('ingredient_name', :with => "tacos")
    click_button('Add ingredient')
    fill_in('instruction_name', :with => "eat all the things")
    click_button('Add instruction')
    fill_in('tag_name', :with => "good food")
    click_button("Add tag")
    expect(page).to have_content('tacos')
    expect(page).to have_content('eat all the things')
    expect(page).to have_content('good food')
  end
end
