class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top], unless: :admin_controller?
  before_action :authenticate_admin!
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def search
    @products = Product.search(params[:query])
  end
  
  
  def after_sign_in_path_for(resource)
    reviews_path
  end
  
  
  
  private
 
  def admin_controller?
    self.class.module_parent_name == 'Admin'
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
