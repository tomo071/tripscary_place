class ApplicationController < ActionController::Base
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :configure_account_update_parameters, if: :devise_controller?
  protected
  
  def configure_permitted_parameters
    
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end
  
  def configure_account_update_parameters
    
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end
end
