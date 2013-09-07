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

def self.to_csv
  CSV.generate do |csv|
    csv << ["Number", "Date","Client", "Start", "End ", "Days", "Unit", "Rate", "Total", "Due on",  "Notes","Status", "CSV Export Date" ]

    all.each do |invoice|
      csv << [invoice.number, invoice.date.strftime("%d %h '%y" ), invoice.client.name, # invnumber, date, client name.
       if !invoice.services.empty? then invoice.services.order("date").first.date.strftime("%d %h %y" ) end , #start
       if !invoice.services.empty? then invoice.services.order("date").last.date.strftime("%d %h %y" ) end, #end 
       if !invoice.services.empty? then (invoice.services.count).to_i  end,  # days 
       if !invoice.services.empty? then invoice.services.first.unit_type end,#unit 
       if !invoice.services.empty? then invoice.services.first.rate end, #Rate
       if !invoice.services.empty? then invoice.services.sum(:rate) end, #total
       if invoice.date  then (invoice.date + 1.month).strftime("%d %h %y" ) end, #invoice date due
       if  !invoice.notes.empty?  then invoice.notes.last.text.split(" ").first(5).join(" ")end ,    #alast note 
       invoice.status,   #status
     Time.now.strftime("%d %h %y" )] #export date
    end
  end
end


# def self.to_csv
#   CSV.generate do |csv|
#     csv << column_names 
    
#     all.each do |invoice|
#       csv << invoice.attributes.values_at(*column_names)
#     end
#   end
# end





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
