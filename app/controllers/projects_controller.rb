class ProjectsController < ApplicationController
    before_action :find_project, only: [:edit, :update, :destroy]
    def new 
        @project = Project.new
    end 
    
    def index
        current_user
        if params[:projects]
            @projects = current_user.projects_with_tasks
        elsif params[:projectss] 
            @projects = current_user.projects # Project.where(user_id: current_user.id)
        else 
            @projects = current_user.projects
        end 
    end
    
    def create 
        current_user
        @project = Project.new(project_params)
        if @project.save
            @project.project_users.create(user: @user)
            #binding.pry#@user =  User.search
            redirect_to @project
        else
            render :new
        end 
    end
    
    def show
            @project = Project.includes(:user, :tasks, :users).find(params[:id])
         if !(@project.users.include?(current_user))
             render html: "<script>alert('You cant view this project!')</script>".html_safe
         end 
    end
    
    def search_users
        @project_id = params[:project_id]
        if params[:name]
            @users = User.search_users(params[:name])
        else
            @users = User.all
        end
    end
    
    def add_user
        @user = User.find(params[:id])
        @project = Project.find(params[:project_id])
        @project.project_users.create(user: @user)
        @project.save
        redirect_to @project
    end
    
    def edit 
        #@project = Project.find(params[:id])
        
    end 
    
    def update 
        # @project = Project.find(params[:id])
         @project.update(project_params)
         redirect_to @project
    end 
    
    def destroy
       # @project = Project.find(params[:id])
        if current_user.id == @project.user_id
            @project.destroy
            redirect_to projects_path
        end 
    end 
    
    
     private
 
    def project_params
        params.require(:project).permit(:title, :content, :user_id, :name)
    end
    
    def find_project
         @project = Project.find(params[:id])
    end 
end
