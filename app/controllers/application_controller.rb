class ApplicationController < ActionController::Base
   before_action :require_login
   helper_method :current_user
   
    private
    def current_user
        @user ||= User.find(session[:user_id])
    end 
    
    def require_login
        redirect_to new_session_path unless session.include? :user_id
    end
end
