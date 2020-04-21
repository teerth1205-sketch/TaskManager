class TasksController < ApplicationController
    before_action :set_project, only: [:new, :create, :edit]
    
    def index
        if params[:project_id]
            @project = Project.includes(:tasks).find(params[:project_id])
            @tasks = @project.tasks
        else
            @user = current_user
            @tasks = @user.tasks
        end
    end
    
    def show
    @task = Task.find(params[:id])
    end
    
    def new
        @users = @project.users
        #@user = @project.users
        @task = Task.new
        @projects = current_user.projects
        
      # binding.pry
    end 
    
    def create
         @users = @project.users
         @task = Task.new
         @projects = current_user.projects
        if @project
            @task = @project.tasks.build(task_params)
        else
            @task = current_user.tasks.build(task_params)
        end
        if @task.save
            redirect_to @task
        else
            render :new
        end
    end 
    
    def edit 
        @task = Task.find(params[:id])
        @user = User.all
        @projects = Project.all 
    end 
    
    def update
         @task = Task.find(params[:id])
         @task.update(task_params)
         redirect_to @task
    end
    
    def complete
        @task = Task.Find(params[:id])
        @task.update(task_params(:complete))
        redirect_to @task
    end 
     private
 
    def task_params
        params.require(:task).permit(:title, :content, :date, :user_id, :project_id, :complete)
    end
    
    def set_project
       project_id = params[:project_id]
        @project = Project.find(project_id) if project_id  
    end
end
