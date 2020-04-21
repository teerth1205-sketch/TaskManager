class UsersController < ApplicationController
  #  before_action :require_login
    skip_before_action :require_login, only: [:new, :create]
    def new 
      @user = User.new
    end 
    
    def create
      @user = User.create(user_params)
      if @user
        session[:user_id] = @user.id
        redirect_to root_path
      else
        render :new
      end 
    end
    
    def edit 
      if current_user.id = params[:id]
        current_user   
      end 
    end 
    
    def update
     @user = User.find(params[:id])
     @user.update(user_params(:name, :email, :password))
     redirect_to root_path
    end 
    
    private
 
    def user_params
    params.require(:user).permit(:name,:email, :password, :password_confirmation)
    end
  
  
end
