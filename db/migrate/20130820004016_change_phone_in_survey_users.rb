class ChangePhoneInSurveyUsers < ActiveRecord::Migration
  def change
    remove_column :survey_users, :phone
    add_column :survey_users, :phone, :text
  end
end
