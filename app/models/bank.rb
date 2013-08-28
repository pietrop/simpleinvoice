class Bank < ActiveRecord::Base
  belongs_to :user
  # belongs_to :invoice, :throght :user
end
