class HomeController < ApplicationController
	def index
		@posts = Post.all.sort_by{|post|post.favorites.count}.reverse
	end

	def search
		puts params[:q]
	if true || params[:q]
      @posts = Post.where("title LIKE '%#{params[:q]}%' OR body LIKE '%#{params[:q]}%'"  )
    else
      @posts = nil
    end
	end
end
