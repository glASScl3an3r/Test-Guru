class AddCompleteToPassedTest < ActiveRecord::Migration[6.1]
  def change
    add_column :passed_tests, :solved, :boolean, null: false, default: false
  end
end
