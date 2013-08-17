class CreateSurveyResults < ActiveRecord::Migration
  def change
    create_table :survey_results do |t|
      t.integer :survey_id
      t.integer :user_id
      t.integer :total_E
      t.integer :total_I
      t.integer :total_S
      t.integer :total_N
      t.integer :total_T
      t.integer :total_F
      t.integer :total_J
      t.integer :total_P
      t.text :survey_answers
      t.timestamps
    end
  end
end
