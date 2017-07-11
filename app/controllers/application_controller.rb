class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def check_is_admin
  	if current_user.is_admin 
  		return true
  	else
  		redirect_to products_path, notice: "Page you are looking for doesn't exist"
  	end
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

private

def after_sign_out_path_for(resource_or_scope)
  new_user_session_path
  end

  def after_sign_in_path_for(resource_or_scope)
    if current_user.is_admin
      dashboard_index_path
    else
      root_path
    end
  end


protected

  def configure_permitted_parameters 
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :gender, :mobile])
  end
end
