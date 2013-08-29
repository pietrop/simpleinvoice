class UsersController < ApplicationController


def edit
  @user = current_user
end
 
def update
  @user = current_user
 
  if @user.update(user_params)
    redirect_to invoice_path(@invoice)
  else
    redirect_to invoice_path(@invoice)
  end
end


private
  def user_params
    params.require(:user).permit(:name, :last_name, :address, :email, :phone)
  end

end 