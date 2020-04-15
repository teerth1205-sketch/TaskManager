module ApplicationHelper
    def current_user
        @user ||= User.find(session[:user_id])
    end 
    
    def require_login
    return head(:forbidden) unless session.user_id == current_user
    
    end
end
