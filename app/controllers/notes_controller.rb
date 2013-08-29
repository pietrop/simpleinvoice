class NotesController < ApplicationController

def index 
  	@user = current_user
		@invoice = @user.invoices.find(params[:invoice_id])
     
		@notes = @invoice.notes 
  end 

def new
		@user = current_user
		@invoice = @user.invoices.find(params[:invoice_id])
		 @note = @invoice.notes.build(params[:note])
      # @note = @invoice.notes
end 

	def create
    @user = current_user
    @invoice = @user.invoices.find(params[:invoice_id])
    @note = @invoice.notes.create(note_params)


 if @note.save
      redirect_to invoice_path(@invoice)
    else
      if !@note
        @note.errors.add(:note, " can't be blank") if params[:text].blank?
      end
      render 'new'
    end

 
    # redirect_to user_invoice_notes_path(@invoice)
  end


  def show
   	@user = current_user
    @invoice = @user.invoices.find(params[:invoice_id])
	@note = @invoice.notes.find(params[:id])
  end 

   def edit 
     @user = current_user
    @invoice = @user.invoices.find(params[:invoice_id])
    @note = @invoice.notes.find(params[:id])
  end


 def update
 @user = current_user
  @invoice = @user.invoices.find(params[:invoice_id])
 @note = @invoice.notes.find(params[:id])
 @note.update(note_params)
 render 'show'

end

#not sure if delete works
def destroy 

@user = current_user
     @invoice = @user.invoices.find(params[:invoice_id])
     @note = @invoice.notes.find(params[:id])
    @note.destroy 

  redirect_to invoice_path(@invoice)
  end 

 private

    def note_params
      params.require(:note).permit(:text)
    end



end
