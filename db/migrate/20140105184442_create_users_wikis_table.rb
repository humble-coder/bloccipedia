class CreateUsersWikisTable < ActiveRecord::Migration
  def up
    create_table :users_wikis, id: false do |t|
      t.references :user
      t.references :wiki
    end
    add_index :users_wikis, [:user_id, :wiki_id]
    add_index :users_wikis, :wiki_id
  end

  def down
    drop_table :users_wikis
  end
end
