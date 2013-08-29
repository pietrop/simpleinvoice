class Note < ActiveRecord::Base
  belongs_to :invoice

  validates :text, presence: true
  validates :invoice_id, presence: :true 
end
