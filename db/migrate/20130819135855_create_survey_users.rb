class CreateSurveyUsers < ActiveRecord::Migration
  def change
    create_table :survey_users do |t|
      t.string :first_name
      t.string :last_name
      t.string :company
      t.string :title
      t.string :email

      t.timestamps
    end
  end
end
