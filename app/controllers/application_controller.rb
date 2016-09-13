class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @_current_user ||= session[:current_user_id] &&
      User.find_by(id: session[:current_user_id])
  end

  def authenticated_only
    flash[:notice] = "please sign in first"
    redirect_to new_login_path unless session[:current_user_id]
  end
end
