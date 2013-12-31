class CreateWikis < ActiveRecord::Migration
  def change
    create_table :wikis do |t|
      t.string :title
      t.test :body
      t.references :user

      t.timestamps
    end
    add_index :wikis, :user_id
  end
end
