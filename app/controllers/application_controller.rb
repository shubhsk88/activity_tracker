class ApplicationController < ActionController::Base
    def current_user
        User.find(session[:user_id]) if session[:user_id]
      end
    
      helper_method :current_user
    
      def require_signin
        redirect_to new_session_url, alert: 'Please sign in first' unless current_user
      end


end
