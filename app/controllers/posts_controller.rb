class PostsController < ApplicationController
	include PostsHelper

	def index
	  @posts = Post.all.order('created_at DESC').paginate(page: params[:page], per_page: 5)
	end

	def new
		@post = Post.new
	end

	def edit
		@post = Post.find(params[:id])
	end

	def show
		@post = Post.find(params[:id])
    @post.increment!(:countclicks) #-> saves the record
	end

	def popular
		@posts = Post.all.order('countclicks DESC').first(3)
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id
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
