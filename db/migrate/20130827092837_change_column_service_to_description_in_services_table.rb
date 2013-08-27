class ChangeColumnServiceToDescriptionInServicesTable < ActiveRecord::Migration
  def change
	  
	   rename_column :services, :service, :description
	  end


  end
