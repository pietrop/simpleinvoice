class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :number
      t.date :date
      t.references :user, index: true

      t.timestamps
    end
  end
end
