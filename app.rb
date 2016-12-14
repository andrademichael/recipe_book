require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end

get('/recipe/:id') do
   recipe_id = params.fetch("id")
   @recipe = Recipe.find(recipe_id.to_i())
   @ingredients = Ingredient.all()
   @instructions = Instruction.all()
   @tags = Tag.all()
  erb(:recipe)
end

post('/recipe') do
  recipe_name = params.fetch("recipe_name")
  @new_recipe = Recipe.new({:name => recipe_name})
  if @new_recipe.save
    redirect ("/recipe/#{@new_recipe.id()}")
  else
    erb(:errors)
  end
end

post("/recipe/:id/add_ingredient") do
  ingredient_name = params.fetch("ingredient_name")
  recipe_id = params.fetch("id").to_i()
  @ingredient = Ingredient.create({:name => ingredient_name})
  redirect to("/recipe/#{recipe_id}")
end

post("/recipe/:id/add_instruction") do
  instruction_name = params.fetch("instruction_name")
  recipe_id = params.fetch("id").to_i()
  @instruction = Instruction.create({:description => instruction_name})
  redirect to("/recipe/#{recipe_id}")
end

post("/recipe/:id/add_tag") do
  tag_name = params.fetch("tag_name")
  recipe_id = params.fetch("id").to_i()
  @tag = Tag.create({:name => tag_name})
  redirect to("/recipe/#{recipe_id}")
end
