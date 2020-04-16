class UsersController < ApplicationController
  #  before_action :require_login
    skip_before_action :require_login, only: [:new, :create]
    def new 
      
    end 
    
    def create
      @user = User.create(user_params)
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    end
    
    private
 
    def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
    end
  
  
end
