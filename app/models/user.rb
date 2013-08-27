class User < ActiveRecord::Base
	has_many :invoices #, dependant: :destroy
	#  has_many :notes , :through :invoices
 # 	has_many :services, :through :invoices
end

