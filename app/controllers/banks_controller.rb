class BanksController < ApplicationController

	def index
		@user = User.find(params[:user_id])
     @banks = @user.banks

	end 

	def new 
		@user = User.find(params[:user_id])
		@bank = @user.build_bank(params[:bank])

	end 

		def create
    @user = User.find(params[:user_id])
    @bank = @user.create_bank(params[:bank].permit(:sort_code, :account_name , :account_number))
    redirect_to user_bank_path(@user , @bank)
  end


 def show 
      @user = User.find(params[:user_id])
  	 @bank = @user.bank
  end


    def edit 
     @user = User.find(params[:user_id])
    @bank = @user.bank
  end 

  def update
  @user = User.find(params[:user_id])
 @bank = @user.bank
 @bank.update(bank_params)
 
redirect_to user_invoice_path(@user, @invoice)



end

def destroy 

@user = User.find(params[:user_id])
    @bank = @user.bank
    @bank.destroy 

   redirect_to user_bank_path(@user)
  end 


private

    def bank_params
      params.require(:bank).permit(:sort_code, :account_name , :account_number)
    end


end
