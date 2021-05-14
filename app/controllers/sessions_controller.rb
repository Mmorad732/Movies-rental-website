class SessionsController < ApplicationController
  skip_before_action :authenticate_admin , :except => [:create]
  def new

  end

  

  def create
    
  	user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      
      log_in user
      redirect_to root_url
    else
      flash[:danger] = 'Invalid email/password combination' 
      render 'new'
    end
  end

  def destroy
    log_out
   
  end
end
