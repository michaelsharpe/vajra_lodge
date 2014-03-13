class AddDegreeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :degree, :integer
  end
end
