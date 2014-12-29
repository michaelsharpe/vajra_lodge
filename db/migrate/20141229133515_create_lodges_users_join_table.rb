class CreateLodgesUsersJoinTable < ActiveRecord::Migration
  def change
    create_table :lodges_users, id: false do |t|
      t.integer :lodge_id
      t.integer :user_id
    end
 
    add_index :lodges_users, :lodge_id
    add_index :lodges_users, :user_id
  end
end
