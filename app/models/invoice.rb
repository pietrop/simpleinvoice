class Invoice < ActiveRecord::Base
  belongs_to :user
  has_many :notes
  has_many :services
  belongs_to :client
  has_one :bank, through: :user

  # has_one :bank, through :user
end
