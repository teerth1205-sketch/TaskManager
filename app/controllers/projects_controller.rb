class ProjectsController < ApplicationController
    
    def new 
        
    end 
    
    def index
        @projects = Project.where(user_id: current_user.id)
        
    end
    
    def create 
        @project = Project.new(project_params)
        @project.save
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
        @project.project_users.create(user: @user, project: @project)
       # @user.projects << @project
        @project.save
        redirect_to @project
    end
    
    def edit 
        @project = Project.find(params[:id])
        
    end 
    
    def update 
         @project = Project.find(params[:id])
         @project.update(project_params)
         redirect_to @project
    end 
    
    def destroy
        @project = Project.find(params[:id])
        if current_user.id == @project.user_id
            @project.delete
        end 
    end 
    
    
     private
 
    def project_params
        params.require(:project).permit(:title, :content, :user_id, :name)
    end

end
