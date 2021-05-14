class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
    before_action :session_check , :except => [:log_in, :log_out]
    before_action :authenticate_admin  , :only => [ :edit,:destroy ,:new]
  
    include UsersHelper
	include SessionsHelper
    include MoviesHelper
	
	
    def session_check
            
            if logged_in?
            @time_left = (session[:expires_at].to_time - Time.now.to_time) 
            	if @time_left > 0.second
            	     @note = @time_left,session[:user_name]
                else
                     log_out 
             	end
            end
            @note = session[:user_name] , session[:expires_at] , logged_in?,"here"
    end
    
    def authenticate_admin 
        if logged_in?
            if session[:auth].eql? 1
                
            else
                redirect_to root_path   
            end
        else
            redirect_to root_path
        end

    end 

    



end
