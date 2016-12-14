class RefactorDatabase < ActiveRecord::Migration[5.0]
  def change
    change_table :recipes do |t|
      t.remove :ingredients, :steps
    end
    create_table :instructions do |t|
      t.string :description
    end
    create_table :ingredients do |t|
      t.string :name
    end
    create_join_table :recipes, :instructions
    create_join_table :recipes, :ingredients
  end
end
