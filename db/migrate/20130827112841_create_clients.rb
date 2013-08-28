class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :address
      t.string :contact_name
      t.string :phone
      t.string :email
      t.string :agency_client

      t.timestamps
    end
  end
end
