class AddTimerToTests < ActiveRecord::Migration[6.1]
  def change
    #в секундах
    add_column :tests, :timer, :integer
  end
end
