class Bank < ActiveRecord::Base
  belongs_to :user
  # belongs_to :invoice, :throght :user

	validates :sort_code, presence: true
	validates :account_name, presence: true
	validates :account_number, numericality: { only_integer: true }


end
