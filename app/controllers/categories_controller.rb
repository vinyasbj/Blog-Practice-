require 'pry'
class CategoriesController < ApplicationController
	def index
		@categories = Category.all
		
	end
	def new
		@category = Category.new
		@comment = Comment.new
	end
	def create
		@category = Category.new(params[:category].permit(:name))
		if @category.save
			redirect_to categories_path , notice: "Sucessfully created from #{@category.name}"
		else
			render action: "new"
		end
	end
	def show
		@category = Category.find(params[:id])	
		@articles = @category.articles #Article.where('category_id = ?', @category.id)
	end
	
	def update
		@category = Category.find(params[:id])
		if @category.update_attributes(params[:category].permit(:name))
			redirect_to categories_path , notice: "Sucessfully updated from #{pre} to #{@category.name}"
		else
			render action: "edit"
		end
	end
	def edit
		@category = Category.find(params[:id])
		
	end
	def destroy
		@category = Category.find(params[:id])
		@category.destroy
		redirect_to categories_path , notice: "Sucessfully destroyed #{@category.name}"
	end
end
