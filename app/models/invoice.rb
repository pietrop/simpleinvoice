class Invoice < ActiveRecord::Base
  belongs_to :user
  has_many :notes
  has_many :services
end
