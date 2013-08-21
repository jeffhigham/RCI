class AddPersonalityTypeToSurveyUsers < ActiveRecord::Migration
  def change
    add_column :survey_users, :personality_type, :string
  end
end
