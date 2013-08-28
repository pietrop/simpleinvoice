class AddClientRefToInvoices < ActiveRecord::Migration
  def change
    add_reference :invoices, :client, index: true
  end
end
