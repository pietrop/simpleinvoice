class Client < ActiveRecord::Base
	has_many :invoices
	has_one :user

	validates :name, presence: true
	
end
