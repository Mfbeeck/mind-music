class SessionsController < ApplicationController
	def new
	end

	def create
	  	@user = User.find_by_username(params[:session][:username])
		  if @user && @user.authenticate(params[:session][:password])
		    session[:user_id] = @user.id
		    redirect_to root_path
		  else
		    redirect_to '/login'
		    flash.notice = "An error occurred upon login. Try again!"
		  end 
	end

	def destroy 
	  	session[:user_id] = nil 
	  	redirect_to '/posts' 
	end
end
