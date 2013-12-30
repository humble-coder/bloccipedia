class AddAccountToUser < ActiveRecord::Migration
  def change
    add_column :users, :account, :string
  end
  add_index :users, :account
end
