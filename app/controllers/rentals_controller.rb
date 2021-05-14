class RentalsController < ApplicationController
     
     before_action :set_user , only: [:index , :show , :edit , :create , :destroy]
     before_action :set_movies , only: [:index ]
     skip_before_action :authenticate_admin , only: [:destroy]
     
     include UsersHelper
    
	 def index
	 	authenticate_user 	
	 end


	def create
        @user = User.find(params[:user_id])
        if Rental.where(:user_id => @user.id , :movie_id => session[:current_movie_id]).exists?
			redirect_to movies_path , notice: "Movie already added to cart"   	
		else
			@userMovie = Rental.new
	        @userMovie.user_id = @user.id 
			@userMovie.movie_id = session[:current_movie_id]
			
				if @userMovie.save
					flash[:success] = 
					redirect_to user_rentals_path , notice: "Movie added to cart"
				else
				    flash[:danger] = "Movie not added"
				    redirect_to movies_path , notice: "Movie not added"
				end 
		end	
	end

	def destroy
		@movie = Rental.find(params[:id])
		@movie.destroy
		if session[:auth].equal? 1
			redirect_back(fallback_location: user_path)
		else	
		    redirect_to user_rentals_url
	    end

	end

	
    private 
	    def set_user
			@user=User.find(params[:user_id])
		end
		def set_movies
			@movies = Rental.where("user_id = ?",params[:user_id])
		end
		
		

		
		

end
