class ServicesController < ApplicationController
	def index
		@user = User.find(params[:user_id])
		@invoice = @user.invoices.find(params[:invoice_id])
		@services = @invoice.services
	end 


	def new
		@user = User.find(params[:user_id])
		@invoice = @user.invoices.find(params[:invoice_id])
		@service = @invoice.services.build(params[:service])
	end 

	def create
    @user = User.find(params[:user_id])
    @invoice = @user.invoices.find(params[:invoice_id])
    @service = @invoice.services.create(service_params)
    redirect_to user_invoice_path(@user, @invoice)
    # redirect_to user_invoice_notes_path(@invoice)
  end

	def show 
	  	@user = User.find(params[:user_id])
	    @invoice = @user.invoices.find(params[:invoice_id])
		@service = @invoice.services.find(params[:id])


	end 


	def edit 
		@user = User.find(params[:user_id])
	    @invoice = @user.invoices.find(params[:invoice_id])
	    @service = @invoice.services.find(params[:id])
	end 

	 def update
		  @user = User.find(params[:user_id])
		  @invoice = @user.invoices.find(params[:invoice_id])
		 @service = @invoice.services.find(params[:id])
		 @service.update(service_params)
		 
		 redirect_to user_invoice_path(@user, @invoice)
	end




def destroy 

	@user = User.find(params[:user_id])
     @invoice = @user.invoices.find(params[:invoice_id])
     @service = @invoice.services.find(params[:id])
    @service.destroy 

   redirect_to user_invoice_path(@user, @invoice)
  end 



 private

    def service_params
      params.require(:service).permit(:date, :description, :unit_type, :rate)
    end


end
