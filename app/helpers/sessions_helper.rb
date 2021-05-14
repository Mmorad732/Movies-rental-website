module SessionsHelper
	
	def log_in(user)
        if current_user
            
        else  
        session[:user_id] = user.id
        session[:user_name] = user.firstName
        session[:auth] = user.authentication
        session[:expires_at] = 60.minute.from_now  
        end  
    end
    
    def current_user
          if session[:user_id]
            @current_user ||= User.find_by(id: session[:user_id])
          end  
        
    end

    def log_out
            session.destroy()
            @note = @current_user
            redirect_to login_path
        
    end

    def session_extend 
        session[:expires_at] = 60.second.from_now
    end

    def logged_in?
    current_user	
    !current_user.nil?
    end
end
