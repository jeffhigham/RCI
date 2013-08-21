class AddTrackingInfoToSurveyUsers < ActiveRecord::Migration
  def change
    add_column :survey_users, :ip_address, :string
    add_column :survey_users, :user_agent, :string
    add_column :survey_users, :zip_code, :string
    add_column :survey_users, :latitude, :string
    add_column :survey_users, :longitude, :string
  end
end
