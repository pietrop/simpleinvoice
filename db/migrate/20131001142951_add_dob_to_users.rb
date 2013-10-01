class AddDobToUsers < ActiveRecord::Migration
  def change
    add_column :users, :dob, :string
    add_column :users, :ni, :string
    add_column :users, :gender, :string
    add_column :users, :jobtitle, :string
  end
end
