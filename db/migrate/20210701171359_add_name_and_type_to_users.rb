class AddNameAndTypeToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false
    add_column :users, :type, :string, null: false, default: 'User'
    add_index :users, :type

    remove_column :users, :name, if_exists: true
  end
end
