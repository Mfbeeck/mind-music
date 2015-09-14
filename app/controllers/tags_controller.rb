class TagsController < ApplicationController
	def show
  	@tag = Tag.find(params[:id])
  	@posts = @tag.posts.order('created_at DESC').paginate(page: params[:page], per_page: 2)
	end

	def index
		@tags = Tag.all.order('name ASC')
	end
end
