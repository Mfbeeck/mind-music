module PostsHelper

	private
		def post_params
	  	params.require(:post).permit(:title, :body, :url, :embed, :tag_list, :image)
		end	
end
