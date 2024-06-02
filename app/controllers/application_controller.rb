class ApplicationController < ActionController::Base
 
  


  
  def search
    @products = Product.search(params[:query])
  end
  
  
  def after_sign_in_path_for(resource)
    reviews_path
  end
  
  
  
  private
 


end
