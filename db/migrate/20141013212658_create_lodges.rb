class CreateLodges < ActiveRecord::Migration
  def change
    create_table :lodges do |t|
      t.string :name
      t.integer :number
      t.date :opened

      t.timestamps
    end
  end
end
