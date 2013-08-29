class ServicesController < ApplicationController
	def index
		@user = current_user
		@invoice = @user.invoices.find(params[:invoice_id])
		@services = @invoice.services
	end 


	def new
		@user = current_user
		@invoice = @user.invoices.find(params[:invoice_id])
		@service = @invoice.services.build(params[:service])
	end 

	def create
 	@user = current_user
    @invoice = @user.invoices.find(params[:invoice_id])
    @service = @invoice.services.create(service_params)



    if @service.save
      redirect_to invoice_path(@invoice)
    else
      if !@service
        @service.errors.add(:service, " can't be blank") if params[:service].blank?
      end
      render 'new'
    end
 




    
    # redirect_to user_invoice_notes_path(@invoice)
  end

	def show 
	  	@user = current_user
	    @invoice = @user.invoices.find(params[:invoice_id])
		@service = @invoice.services.find(params[:id])


	end 


	def edit 
		@user = current_user
	    @invoice = @user.invoices.find(params[:invoice_id])
	    @service = @invoice.services.find(params[:id])
	end 

	 def update
		  @user = current_user
		  @invoice = @user.invoices.find(params[:invoice_id])
		 @service = @invoice.services.find(params[:id])
		 @service.update(service_params)
		 
		 redirect_to invoice_path(@invoice)
	end




def destroy 

	@user = current_user
     @invoice = @user.invoices.find(params[:invoice_id])
     @service = @invoice.services.find(params[:id])
    @service.destroy 

   redirect_to invoice_path( @invoice)
  end 



 private

    def service_params
      params.require(:service).permit(:date, :description, :unit_type, :rate)
    end


end
