class UsersController < ApplicationController
  #  before_action :require_login
    
    def new 
      
    end 
    
    def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to user_path(@user.id)
    end
    
    def show
        @tasks =  current_user.tasks
        
    end 
    
    private
 
    def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
    end
  
  
end
