require('spec_helper')

describe('adding a recipe object', {:type => :feature}) do
  it('allows a user to create a new recipe with a name, ingredients and instructions') do
    visit('/')
    fill_in('recipe_name', :with => "Lulu Beansy")
    click_button('Create Recipe')
    fill_in('ingredient_name', :with => "tacos")
    expect(page).to have_content('tacos')
  end
end
