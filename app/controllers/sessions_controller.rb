class SessionsController < ApplicationController
  skip_before_action :authenticate_admin , :except => [:create]
  def new

  end

  

  def create
    
  	user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      log_in user
      redirect_to root_url
    else
      #flash[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
  #  redirect_back(fallback_location: root_path,data: { confirm: 'Are you sure?' })
   # @popup = true
    log_out
   
  end
end
