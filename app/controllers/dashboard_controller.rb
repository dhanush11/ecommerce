class DashboardController < ApplicationController

    before_action :authenticate_user!
	before_action :check_is_admin


  def index
  	@categories = Category.all 
  	@sub_categories = SubCategory.all 
  	@products = Product.all 
  	@users = User.all 
  	@orders = Order.all 
  	@reviews = Review.all 
  end

  def orders_report
  	
       
  end
end
