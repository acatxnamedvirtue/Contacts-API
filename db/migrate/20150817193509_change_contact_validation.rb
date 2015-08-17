class ChangeContactValidation < ActiveRecord::Migration
  def change
    remove_index :contacts, name: :index_contacts_on_user_id

    add_index :contacts, [:email, :user_id], unique: true
  end
end
