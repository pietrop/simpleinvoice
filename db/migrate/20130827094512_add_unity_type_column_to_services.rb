class AddUnityTypeColumnToServices < ActiveRecord::Migration
  def change
    add_column :services, :unit_type, :string
  end
end
