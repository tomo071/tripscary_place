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

  def after_sign_in_path_for(resource)
    my_page_path(current_user)
  end

  def after_sign_out_pathfor(resource)
    root_path
  end

  protected


end
