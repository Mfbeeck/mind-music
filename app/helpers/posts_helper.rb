module PostsHelper

	private
		def post_params
	  	params.require(:post).permit(:title, :body, :url, :embed)
		end	
end
