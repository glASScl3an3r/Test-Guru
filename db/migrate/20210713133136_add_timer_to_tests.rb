class AddTimerToTests < ActiveRecord::Migration[6.1]
  def change
    #в секундах
    add_column :tests, :timer, :integer, null: false, default: 24 * 60 * 60 #по дефолту таймер - 1 день
  end
end
