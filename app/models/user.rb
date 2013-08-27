class User < ActiveRecord::Base
	has_many :invoices
	# has_many :notes , :through :invoices
end

