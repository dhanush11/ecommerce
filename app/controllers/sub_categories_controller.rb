class SubCategoriesController < ApplicationController
    
    #before_action :authenticate_user!
	before_action :authenticate_user!, except: [:index, :show]
    before_action :check_is_admin, except: [:index, :show]

	def index
		@sub_categories = SubCategory.all 
	end
	def new
		@sub_category = SubCategory.new
	end
	def create
		@sub_category = SubCategory.new(params[:sub_category].permit(:name, :category_id))
		if @sub_category.save
			redirect_to sub_categories_path , notice: "Successfully Add SubCategory"
		else
			render action: "new"
		end
	end
	def show
		@sub_category = SubCategory.find(params[:id]) 
		
	end
	def edit
		@sub_category = SubCategory.find(params[:id])
	end
	def update
		@sub_category = SubCategory.find(params[:id])
		if @sub_category.update_attributes(params[:sub_category].permit(:name, :category_id))
			redirect_to sub_category_path , notice: "Successfully Updated SubCategory"	
		else
			render action: "edit"		
		end
	end

	def destroy
		@sub_category = SubCategory.find(params[:id])
		@sub_category.destroy
		redirect_to sub_categories_path , notice: "Successfully Deleted SubCategory"
	end

	
end
# def show
# 		@sub_category = SubCategory.find(params[:id])
# 		# @category = Category.where("@category = ?" , category.id)
# 		redirect_to sub_categories_path
# 	end
# 	def edit
# 		@sub_category = SubCategory.find(params[:id])
# 	end
