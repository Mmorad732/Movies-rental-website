module UsersHelper
	def authenticate_user
		if session[:user_id].nil?
			redirect_to root_path
	    elsif (session[:user_id] != @user.id) && (session[:auth].eql?2)
            redirect_to root_path
	    end
	end	

	
end
