class SessionsController < ApplicationController
    skip_before_action :require_login, only: [:new, :create]
    
    def new 
      
    end 
    
    def create
      if auth_hash = request.env["omniauth.auth"]
       user = User.find_or_create_by_omniauth(auth_hash)
       session[:user_id] = user.id
       redirect_to root_path
     else 
      @user = User.find_by(email: params[:user][:email])
      return head(:forbidden) unless @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to root_path
     end 
    end
    
    def destroy
      session.clear
    end 
    
end 