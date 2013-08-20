class AddCellPhoneToSurveyUsers < ActiveRecord::Migration
  def change
    add_column :survey_users, :phone, :string, default:" 000-000-0000"
  end
end
