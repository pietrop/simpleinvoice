class CreateBanks < ActiveRecord::Migration
  def change
    create_table :banks do |t|
      t.string :sort_code
      t.string :account_name
      t.integer :account_number
      t.references :user, index: true

      t.timestamps
    end
  end
end
