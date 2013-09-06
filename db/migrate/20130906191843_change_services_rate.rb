class ChangeServicesRate < ActiveRecord::Migration
  def change

  	change_column(:services, :rate, :decimal, {precision:  => 8, scale:  => 2})
  end
end
