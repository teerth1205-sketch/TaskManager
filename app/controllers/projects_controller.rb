class ProjectsController < ApplicationController
    
    def new 
        
    end 
    
    def index
        @projects = Project.where(user_id: current_user.id)
        
    end
    
    def create 
        @project = Project.create(project_params)
        #@user =  User.search
        redirect_to @project
    end
    
    def show 
        @project = Project.includes(:user, :tasks, :users).find(params[:id])
        #@user =  User.search(params[:q])
    end
    
    def search_users
        @project_id = params[:project_id]
        if params[:name]
            @users = User.where('name LIKE ?', "%#{params[:name]}%")
        else
            @users = User.all
        end
    end
    
    def add_user
        @user = User.find(params[:id])
        @project = Project.find(params[:project_id])
        @project.users << @user
        redirect_to @project
    end
    
    def edit 
        
    end 
    
    def update 
        
    end 
    
     private
 
    def project_params
        params.require(:project).permit(:title, :content, :user_id, :name)
    end

end
