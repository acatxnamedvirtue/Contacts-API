class ChangeUsers < ActiveRecord::Migration
  def change
    remove_column :users, :email
    rename_column :users, :name, :username
    change_column :users, :username, :string, null: false

    add_index :users, :username, unique: true
  end
end
