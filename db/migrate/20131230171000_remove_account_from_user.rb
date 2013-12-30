class RemoveAccountFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :account
  end

  def down
  end
end
