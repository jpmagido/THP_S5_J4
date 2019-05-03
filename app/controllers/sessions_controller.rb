class SessionsController < ApplicationController

	def new
	end

	def profile
	end

	def create
		user = User.find_by(email: params[:email])

	  if user && user.authenticate(params[:password])
	    session[:user_id] = user.id
	    redirect_to sessions_profile_path
	  else
	    flash.now[:danger] = 'Invalid email/password combination'
	    render 'new'
	  end
  	end


	def destroy
		session.delete(:user_id)
		redirect_to new_session_path		
	end
end
