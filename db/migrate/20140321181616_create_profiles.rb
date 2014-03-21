class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.integer :degree
      t.integer :roles_mask
      t.boolean :disabled
      t.text :address
      t.text :phone
      t.text :bio

      t.timestamps
    end
  end
end
