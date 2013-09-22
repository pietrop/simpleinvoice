class Service < ActiveRecord::Base
  belongs_to :invoice
  belongs_to :clients

  default_scope -> { order('created_at DESC') }
  validates :rate,  numericality: { only_decimal: true }
  validates :date, presence: true
  validates :description, presence: :true 
  validates :unit_type, presence: :true 
 


end
