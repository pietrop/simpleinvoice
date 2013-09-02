class Invoice < ActiveRecord::Base
  belongs_to :user
  has_many :notes
  has_many :services
  belongs_to :client
  has_one :bank, through: :user

  # has_one :bank, through :user


   default_scope -> { order('created_at DESC') }
  validates :number,  numericality: { only_integer: true }, uniqueness: true
  validates :date, presence: true
  # validates :client_id, presence: :true

  def status
    if paid == false && (1.month.ago > date)
      'Overdue'
    elsif paid == false
      'Unpaid'
    else
      'Paid'
    end
  end
  
end
