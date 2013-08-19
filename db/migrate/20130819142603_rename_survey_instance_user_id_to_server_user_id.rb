class RenameSurveyInstanceUserIdToServerUserId < ActiveRecord::Migration
  def change
    rename_column :survey_results, :user_id, :survey_user_id
  end
end
