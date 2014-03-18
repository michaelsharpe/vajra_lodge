class CreateMinutes < ActiveRecord::Migration
  def change
    create_table :minutes do |t|
      t.integer :degree
      t.date :date
      t.integer :open
      t.integer :close
      t.text :content
      t.boolean :reviewed

      t.timestamps
    end
  end
end
