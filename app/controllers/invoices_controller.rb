class InvoicesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
     @invoices = @user.invoices
    # @client = Client.find(params[:client_id])

    # if @user
    #   @invoices = @user.invoices
    # elsif @client
    #   @invoices = @client.invoices
    # end
  end 


  def new 
    @user = User.find(params[:user_id])
     @invoice = @user.invoices.build(params[:invoice])
  end 

	def create
    @user = User.find(params[:user_id])
    @invoice = @user.invoices.create(params[:invoice].permit(:number, :date))
    redirect_to user_path(@user)
  end

  def show 
      @user = User.find(params[:user_id])
  	 @invoice = @user.invoices.find(params[:id])
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
