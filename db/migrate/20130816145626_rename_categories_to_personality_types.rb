class RenameCategoriesToPersonalityTypes < ActiveRecord::Migration
  def change
    rename_table :categories, :personality_types
  end
end
