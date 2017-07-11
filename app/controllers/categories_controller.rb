class CategoriesController < ApplicationController

    before_action :authenticate_user!, except: [:index, :show]
	before_action :check_is_admin, except: [:index, :show]

=begin 
	index 
	new
	create
	show
	edit
	update
	destroy 
=end

	def index
		@categories = Category.all
	end

	def new 
		@category = Category.new 
	end

	def create
		@category = Category.new(params[:category].permit(:name))
		#binding.pry
		if @category.save
			redirect_to categories_path, notice: "Sucessfully created #{@category.name}"
		else 
			render action: "new"
		end
	end

	def show
		@category = Category.find(params[:id])
		@products = @category.products #Product.where('category_id = ?', @category.id)
	end

	def edit
		@category = Category.find(params[:id])
	end

	def update
		@category = Category.find(params[:id])
		previous_name = @category.name
		#binding.pry
		if @category.update_attributes(params[:category].permit(:name))
		#binding.pry
			redirect_to category_path(@category.id), notice: "Sucessfully updated form #{previous_name} to #{@category.name}"
		else 
			render action: "edit"
		end
	end

	def destroy
		@category = Category.find(params[:id])
		@category.destroy 
		redirect_to categories_path, notice: "Sucessfully deleted #{@category.name}"
	end


end
