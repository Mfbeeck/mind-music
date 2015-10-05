class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  	before_filter :set_tags
	helper_method :current_user 

	# setting current user
	def current_user 
	  @current_user ||= User.find(session[:user_id]) if session[:user_id] 
	end

	def require_user 
  		redirect_to '/login' unless current_user 
	end

	# Setting @tags to be available across entire app
	def set_tags
		@tags = Tag.all.order('name ASC')
	end

	#require admin for certain things in controller
	def require_admin 
	  	if current_user.admin
	  	else
	  		redirect_to :back
			flash.notice = "You are not the admin!"
		end
	end    
end
