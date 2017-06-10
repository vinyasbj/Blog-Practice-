class CommentsController < ApplicationController
	def index
		@comments = Comment.all
	end
	def new
		@comment = Comment.new
	end
	def create
		
		@comment = Comment.new(params[:comment].permit(:title,:body,:article_id))
		if @comment.save 
			redirect_to articles_path(@comment.article_id)
		else
			render action: "new"
		end
	end
end
