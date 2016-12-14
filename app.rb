require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end

get('/recipe/:id') do
   recipe_id = params.fetch("id")
   @recipe = Recipe.find(recipe_id.to_i())
  erb(:recipe)
end

post('/recipe') do
  recipe_name = params.fetch("recipe_name")

  @new_recipe = Recipe.new({:name => recipe_name})
  if @new_recipe.save
    redirect ("/recipe/#{@new_recipe.id()}")
  else
    alert("you suck.")
  end
end
