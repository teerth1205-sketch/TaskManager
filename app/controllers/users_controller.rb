class UsersController < ApplicationController
  #  before_action :require_login
    skip_before_action :require_login, only: [:new, :create]
    def new 
      @user = User.new
    end 
    
    def create
      @user = User.new(user_params)
      if @user.save
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
      params[:user].delete(:password) if params[:user][:password].blank?

      current_user.update(user_params)
     # binding.pry
      if current_user.save
      
     redirect_to root_path
      else
     render :edit
      end
    end 
    
    private
 
    def user_params
    params.require(:user).permit(:name,:email, :password, :password_confirmation)
    end
  
  
end
