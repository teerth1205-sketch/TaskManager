class ProjectsController < ApplicationController
    
    def new 
        
    end 
    
    def index
        @projects = Project.where(user_id: current_user.id)
    end
    
    def create 
        @project = Project.create(project_params)
        redirect_to @project
    end
    
    def show 
        @project = Project.includes(:user, :tasks, :users).find(params[:id])
    end 
    
    def edit 
        
    end 
    
    def update 
        
    end 
    
     private
 
    def project_params
        params.require(:project).permit(:title, :content, :user_id)
    end

end
