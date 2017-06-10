class ArticlesController < ApplicationController
	def index
		@articles = Article.all 
	end
	def new
		@article = Article.new
	end
	def create
		@article = Article.new(params[:article].permit(:title,:body,:category_id,:publish_date))
		if @article.save 
			redirect_to article_path(@article.id) , notice: "Sucessfully Article Created "
		else
			render action: "new"
		end
	end
	def show
		@article = Article.find(params[:id])

	end
	def edit
		@article = Article.find(params[:id])
	end
	def update
		@article = Article.find(params[:id])
		if @article.update_attributes(params[:article].permit(:title,:body,:category_id,:publish_date))
			redirect_to article_path(@article.id) , notice: "Sucessfully updated a Article"
		else
			render action: "edit"
		end
	end
	def destroy
		@article = Article.find(params[:id])
		redirect_to articles_path , notice: "Sucessfully deleted a Article"
	end
end
