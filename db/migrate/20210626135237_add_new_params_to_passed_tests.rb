class AddNewParamsToPassedTests < ActiveRecord::Migration[6.1]
  def change
    add_column :passed_tests, :correct_questions, :integer, default: 0, null: false
    add_reference :passed_tests, :current_question, foreign_key: { to_table: :questions }
  end
end
