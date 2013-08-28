class NotesController < ApplicationController

def index 
  	@user = User.find(params[:user_id])
		@invoice = @user.invoices.find(params[:invoice_id])
		@notes = @invoice.notes 
  end 

def new
		@user = User.find(params[:user_id])
		@invoice = @user.invoices.find(params[:invoice_id])
		 @note = @invoice.notes.build(params[:note])
end 

	def create
    @user = User.find(params[:user_id])
    @invoice = @user.invoices.find(params[:invoice_id])
    @note = @invoice.notes.create(note_params)


 redirect_to user_invoice_path(@user, @invoice)
    # redirect_to user_invoice_notes_path(@invoice)
  end


  def show
   	@user = User.find(params[:user_id])
    @invoice = @user.invoices.find(params[:invoice_id])
	@note = @invoice.notes.find(params[:id])
  end 

   def edit 
     @user = User.find(params[:user_id])
    @invoice = @user.invoices.find(params[:invoice_id])
    @note = @invoice.notes.find(params[:id])
  end


 def update
  @user = User.find(params[:user_id])
  @invoice = @user.invoices.find(params[:invoice_id])
 @note = @invoice.notes.find(params[:id])
 @note.update(note_params)
 render 'show'

end

#not sure if delete works
def destroy 

@user = User.find(params[:user_id])
     @invoice = @user.invoices.find(params[:invoice_id])
     @note = @invoice.notes.find(params[:id])
    @note.destroy 

  redirect_to user_invoice_path(@user, @invoice)
  end 

 private

    def note_params
      params.require(:note).permit(:text)
    end



end
