# создание таблицы для реализации связи многие ко многим
# https://stackoverflow.com/questions/17765249/generate-migration-create-join-table

class CreateJoinTableUsersBadges < ActiveRecord::Migration[6.1]
  def change
    create_join_table :users, :badges do |t|
      t.index [:user_id, :badge_id]
      t.index [:badge_id, :user_id]
    end
  end
end
