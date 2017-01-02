class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # restrict access to admin module for non-admin users
  def authenticate_admin_user!
    raise SecurityError unless current_admin_user.try(:is_admin?)
  end

  # path for redirection after user sign_in, depending on user role
  def after_sign_in_path_for(user)
    user.is_admin? ? admin_dashboard_path : root_path
  end

  # raise security error if access has been denied
  rescue_from SecurityError do |exception|
    sign_out
    redirect_to new_admin_user_session_path
  end
end
