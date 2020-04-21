class TasksController < ApplicationController
    before_action :set_project, only: [:new, :create, :edit]
    #before_action :is_task_owner, only: [:show, :edit]
    
    
    def index
        if params[:project_id]
            @project = Project.includes(:tasks).find(params[:project_id])
            @tasks = @project.tasks
        else
            current_user
            @tasks = @user.tasks
        end
    end
    
    def show
        @task = Task.find(params[:id])
       # is_task_owner(:show)
    end
    
    def new
        if @project
            @users = @project.users
        end#@user = @project.users
        @task = Task.new
        @projects = current_user.projects
        
      # binding.pry
    end 
    
    def create
        if @project
         @users = @project.users
        end 
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
        is_task_owner(:edit)
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
    
    def destroy
        @task = Task.find(params[:id])
        if current_user.id = @task.user_id
            @task.destroy
            redirect_to tasks_path
        end 
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
