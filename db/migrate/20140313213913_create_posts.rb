class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :degree
      t.text :content

      t.timestamps
    end
  end
end
