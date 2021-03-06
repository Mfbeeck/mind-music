class UsersController < ApplicationController
	before_action :require_admin, only: [:index, :edit, :update]
	before_action :require_user, only: [:show]
	include UsersHelper

  def index
  	@users = User.all
  end

  def new
  	@user = User.new
  end
  
  def create 
  	@user = User.new(user_params) 
  	if @user.save 
    	session[:user_id] = @user.id 
    	redirect_to '/' 
  	else 
    	redirect_to '/signup' 
    	flash.notice = "You are missing info!"
  	end 
  end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)
		redirect_to users_path
		flash.notice = "The user \"#{@user.username}\" was successfully updated."
	end

	def show
		@user = current_user
		@posts = current_user.posts.order('countclicks DESC')
	end

	def edit
		@user = User.find(params[:id])
	end

end