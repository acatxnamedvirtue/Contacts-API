class ChangeContactShareValidation < ActiveRecord::Migration
  def change

    remove_index :contact_shares, :contact_id
    remove_index :contact_shares, :user_id

    add_index :contact_shares, [:contact_id, :user_id], unique: true
  end
end
