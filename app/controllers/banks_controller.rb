class BanksController < ApplicationController

	def index
		@user = current_user
     @banks = @user.banks

	end 

	def new 
		@user = current_user
		@bank = @user.build_bank(params[:bank])

	end 

		def create
    @user = current_user
    @bank = @user.create_bank(params[:bank].permit(:sort_code, :account_name , :account_number))
    redirect_to invoice_path( @invoice)
  end


 def show 
      @user = current_user
  	 @bank = @user.bank
  end


    def edit 
     @user = current_user
    @bank = @user.bank
  end 

  def update
  @user = current_user
 @bank = @user.bank
 @bank.update(bank_params)
 
redirect_to invoice_path( @invoice)



end

def destroy 

@user = current_user
    @bank = @user.bank
    @bank.destroy 

   redirect_to user_bank_path(@user)
  end 


private

    def bank_params
      params.require(:bank).permit(:sort_code, :account_name , :account_number)
    end


end
