class ProjectsController < ApplicationController
    
    def new 
        
    end 
    
    def index
        @projects = Project.where(user_id: current_user.id)
    end
    
    def create 
        Project.create(project_params)
        redirect_to projects_path
    end 
    
    def show 
        
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
