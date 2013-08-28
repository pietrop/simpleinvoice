class InvoicesController < ApplicationController
  def index
    @user = current_user
     @invoices = @user.invoices
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
    
    @client = Client.find_or_create_by(name: params[:client])
    #params[:invoice]=create({:number=>params[:number],:date=>params[:date:]})
    @invoice = @user.invoices.create(params[:invoice].permit(:number, :date))

    @invoice.client = @client

    # redirect_to 'root'

    # find_or_create_by()
    @invoice.client = @client
    @invoice.user = @user
    
    @invoice.save

  end

  def show 
      @user = User.find(params[:user_id])
  	 @invoice = @user.invoices.find(params[:id])
     
    @services = @invoice.services # to show service on invoice show page

    @client = @invoice.client
    @bank = @user.bank
  end

  def edit 
     @user = User.find(params[:user_id])
    @invoice = @user.invoices.find(params[:id])


  end 

  def update
  @user = User.find(params[:user_id])
 @invoice = @user.invoices.find(params[:id])
 @invoice.update(invoice_params)
 render 'show'

end

#not sure if delete works
def destroy 

@user = User.find(params[:user_id])
    @invoice = @user.invoices.find(params[:id])
    @invoice.destroy 

   redirect_to user_invoices_path(@user)
  end 

 private

    def invoice_params
      params.require(:invoice).permit(:number, :date)
    end

end
