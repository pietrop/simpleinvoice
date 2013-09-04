class ChangeAccountNumberToStringInBankTable < ActiveRecord::Migration
  def change
  	 change_column(:banks, :account_number, :string)
  end
end
