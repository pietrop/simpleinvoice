class InvoicesController < ApplicationController
respond_to :html, :json

  def index

 



    @user = current_user
     @invoices = @user.invoices.order(:number)
  respond_to do |format|
    format.html
    format.csv { send_data @invoices.to_csv, filename:  "#{current_user.name.capitalize}_#{current_user.last_name.capitalize}_Invoices_#{Time.now.strftime("%d%h'%y_%H-%M")}_SimpleInvoiceExport.csv" }
    format.xls #{ send_data @invoices.to_csv,filename: "#{current_user.name.capitalize}_#{current_user.last_name.capitalize}_Invoices_#{Time.now.strftime("%d%h'%y_%H-%M")}_SimpleInvoiceExport.xls"}
    # { send_data @products.to_csv(col_sep: "\t")  }


if params[:tag]
    @invoices = @user.invoices.tagged_with(params[:tag])
  else
    @invoices = @user.invoices
  end



  end

@invoices2013_2014

    # @services = @invoice.services
    # @client = Client.find(params[:client_id])

    # if @user
    #   @invoices = @user.invoices
    # elsif @client
    #   @invoices = @client.invoices
    # end
  end 

  def new 
    @user = current_user
     @invoice = @user.invoices.build(params[:invoice])
     @current_user_client = @user.clients
     

     
  end 

	def create
    @user = current_user

    #params[:invoice]=create({:number=>params[:number],:date=>params[:date:]})
    @invoice = @user.invoices.create(params[:invoice].permit(:number, :date))

    @invoice.client = @client

    # redirect_to 'root'

    # find_or_create_by()
    @invoice.user = @user
    @client = params[:client].blank? ? nil : Client.find_or_create_by(name: params[:client])

    @invoice.client = @client
    
    if @client && @invoice.save
      
      redirect_to invoice_path(@invoice)

    else
      if !@client
        @invoice.errors.add(:client, " can't be blank") if params[:client].blank?
      end
      render 'new'
    end
  end

  def show 
    @body_class = 'invoice'
     @user = current_user
  	 @invoice = @user.invoices.find(params[:id])
     
    @services = @invoice.services # to show service on invoice show page
    @client = @invoice.client
    @bank = @user.bank
  end

  def edit 
     @user = current_user
    @invoice = @user.invoices.find(params[:id])


  end 

  def update
  @user = current_user
 @invoice = @user.invoices.find(params[:id])
 @invoice.update(invoice_params)
 render 'show'
 

end

#not sure if delete works
def destroy 

    @user = current_user
    @invoice = @user.invoices.find(params[:id])
    @invoice.destroy 

   redirect_to invoices_path 
    end 

 private

    def invoice_params
      params.require(:invoice).permit(:number, :date, :paid,:tag_list)
    end

end
