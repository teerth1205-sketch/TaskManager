class ApplicationController < ActionController::Base
   before_action :require_login
   helper_method :current_user, :is_task_owner
   
   protect_from_forgery 
   
    private
    def current_user
        @user ||= User.find(session[:user_id])
    end 
    
    def require_login
        redirect_to new_session_path unless session.include? :user_id
    end
    
    def is_task_owner(layout)
        if !(@task.user_id == current_user.id)
           render html: "<script>alert('No users!')</script>".html_safe
            
        end 
    end 
end
