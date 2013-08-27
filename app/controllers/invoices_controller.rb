class InvoicesController < ApplicationController
	def create
    @user = User.find(params[:user_id])
    @invoice = @user.invoices.create(params[:invoice].permit(:number, :date))
    redirect_to user_path(@user)
  end

  def show 
      @user = User.find(params[:user_id])
  	 @invoice = @user.invoices.find(params[:id])
  end

  def index 
  	@user = User.find(params[:user_id])
  	 @invoices = @user.invoices
  end 

  def new 
  	@user = User.find(params[:user_id])
		 @invoice = @user.invoices.build(params[:invoice])
  end 

  def edit 
     @user = User.find(params[:user_id])
    @invoice = @user.invoices.find(params[:id])
  end 

  def update
  @user = User.find(params[:user_id])
 @invoice = @user.invoices.create(invoice_params)
 render 'show'

end


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
