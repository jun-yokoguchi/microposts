class AddAgeToUser < ActiveRecord::Migration
  def change
    add_column :users, :age, :integer
    add_column :users, :gender, :string
    add_column :users, :area, :string
    add_column :users, :favorit, :string
  end
end
