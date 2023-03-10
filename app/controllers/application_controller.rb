class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_admin!, if: :admin_url

  def admin_url
    request.fullpath.include?("/admin")
  end

  protected

  def configure_permitted_parameters
    added_attrs = [ :last_name, :first_name, :last_name_kana, :first_name_kana, :email, :phone, :post_code, :address,:password ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  end

end
