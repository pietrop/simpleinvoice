class WelcomeController < ApplicationController
  skip_before_filter :authenticate_user!

  def index
  	redirect_to '/invoices' if current_user
  	@body_class = 'welcome'
  end
end
