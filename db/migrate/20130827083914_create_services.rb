class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.date :date
      t.string :service
      t.integer :rate
      t.references :invoice, index: true

      t.timestamps
    end
  end
end
