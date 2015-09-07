class PostsController < ApplicationController
	include PostsHelper

	def index
	  @posts = Post.all
	end

	def new
		@post = Post.new
	end

	def edit
		@post = Post.find(params[:id])
	end

	def show
		@post = Post.find(params[:id])
	end

	def create
		@post = Post.new(post_params)
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
