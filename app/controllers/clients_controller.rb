class ClientsController < ApplicationController

	def index
		
    @user = current_user
    @clients = @user.clients #.group(:name)
	end 

	def new
		@client = Client.new
	end

	def create
  @client = Client.new(client_params)
 
  if @client.save
  redirect_to @client
  else
    render 'new'
  end
end

def show
  @user = current_user
  @client = @user.clients.find(params[:id])
  # @client = Client.find(params[:id])

   # @user = current_user 
   # @clients = @user.clients
  # @client = Client.find(params[:id])

  # @client = @user.clients.find(params[:invoice_id])
 
  
end


def edit
  @user = current_user
  @client = @user.clients.find(params[:id])
end
 
def update
    @user = current_user
  @client = @user.clients.find(params[:id])
 
  if @client.update(client_params)
    redirect_to @client
  else
    render 'edit'
  end
end


def destroy
  @user = current_user
  @client = @user.clients.find(params[:id])
  @client.destroy
 
  redirect_to clients_path
end



private
	def client_params
		params.require(:client).permit(:name, :address,  :contact_name, :phone, :email, :agency_client )
	end

end

