class TagsController < ApplicationController
	def show
	  	@tag = Tag.find(params[:id])
	  	@posts = @tag.posts.order('created_at DESC').paginate(page: params[:page], per_page: 3)
	end

	def index
		@alltags_page = true
	end

end
