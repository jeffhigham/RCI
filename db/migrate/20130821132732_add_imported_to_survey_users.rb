class AddImportedToSurveyUsers < ActiveRecord::Migration
  def change
    add_column :survey_users, :imported, :boolean
  end
end
