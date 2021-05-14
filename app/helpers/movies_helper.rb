module MoviesHelper
	def movie_man_auth

        if session[:auth] != nil
		@format =  " <%= link_to \"Rent\" ,  user_rentals_path(session[:user_id]) ,:method => :Post,:class => 'btn btn-success'%>"
	    end
		if session[:auth] == 1
            @format = "<%= link_to \"Edit\" , edit_movie_path(@movie) ,:class => 'btn btn-primary'%>
            <%= link_to \"Delete\" , movie_path(@movie) , method: :delete ,:class => 'btn btn-danger'%> "+@format
	    end 
		
		render :inline => @format
	end
end
