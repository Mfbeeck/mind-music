class PostsController < ApplicationController
	include PostsHelper
	before_action :require_admin, only: [:new, :create, :edit, :update, :destroy]

	def index
	  @posts = Post.all.order('created_at DESC').paginate(page: params[:page], per_page: 5)
	  @home_page = true
	end

	def new
		@post = Post.new
	end

	def edit
		@post = Post.find(params[:id])
	end

	def show
		@post = Post.find(params[:id])
    	if current_user && @post.user_id = current_user.id
    	else	
    		@post.increment!(:countclicks) #-> saves the record
    	end
	end

	def popular
		@posts = Post.all.order('countclicks DESC').first(5)
		@popular_page = true
	end

	def favorite
		@posts = Post.where('rating is not null').order('rating DESC').first(5)
		@favorite_page = true
	end


	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id
		@post.countclicks = 0
		@post.save
		redirect_to posts_path
		flash.notice = "The post \"#{@post.title}\" was successfully created."
	end

	def update
		@post = Post.find(params[:id])
		@post.update(post_params)
		redirect_to post_path(@post)
		flash.notice = "The post \"#{@post.title}\" was successfully updated."
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path
		flash.notice = "The post \"#{@post.title}\" was successfully deleted."
	end

end
