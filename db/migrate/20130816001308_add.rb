class Add < ActiveRecord::Migration
  def change
    add_column :answers, :category, :text
  end
end
