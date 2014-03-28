class CreateMilestones < ActiveRecord::Migration
  def change
    create_table :milestones do |t|
      t.integer :user_id
      t.string :category
      t.string :event
      t.date :date
      t.string :location
      t.text :description

      t.timestamps
    end
  end
end
