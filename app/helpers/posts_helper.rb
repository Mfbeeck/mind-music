module PostsHelper

	private
		def post_params
	  		params.require(:post).permit(:title, :body, :url, :embed, :tag_list, :image, :user_id, :youtube_url, :rating, :sourceurl)
		end	

	  	def embed(youtube_url)
		    youtube_id = youtube_url.split("=").last
		    content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}")
		end
end
