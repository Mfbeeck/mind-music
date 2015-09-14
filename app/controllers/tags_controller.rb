class TagsController < ApplicationController
	def show
  	@tag = Tag.find(params[:id])
  	@posts = @tag.posts.order('created_at DESC')
	end

	def index
		@tags = Tag.all.order('name ASC')
	end
end
