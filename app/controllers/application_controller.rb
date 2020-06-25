class ApplicationController < ActionController::Base
  def current_user
    User.find_by(username: session[:username]) if session[:username]
  end

  helper_method :current_user

  def require_signin
    redirect_to new_login_url, alert: 'Please sign in first' unless current_user
  end
end
