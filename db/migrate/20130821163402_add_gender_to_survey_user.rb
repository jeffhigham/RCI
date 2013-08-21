class AddGenderToSurveyUser < ActiveRecord::Migration
  def change
    add_column :survey_users, :gender, :string
  end
end
