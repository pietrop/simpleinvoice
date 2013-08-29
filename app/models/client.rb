class Client < ActiveRecord::Base
	has_many :invoices
	belongs_to :user

	validates :name, presence: true
	
end
