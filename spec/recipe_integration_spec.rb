require('spec_helper')

describe('adding a recipe object', {:type => :feature}) do
  it('allows a user to create a new recipe with a name, ingredients and instructions') do
    visit('/')
    fill_in('recipe_name', :with => "Lulu Beansy")
    fill_in('ingredient0', :with => 'carrot')
    click_button('Add another ingredient:')
    fill_in('ingredient1', :with => 'spinach')
    fill_in('instruction0', :with => 'chop ALL the things')
    click_button('Create Recipe')
    expect(page).to have_content('Lulu Beansy')
  end
end
