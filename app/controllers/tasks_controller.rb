class TasksController < ApplicationController
    before_action :find_task, only: [:show, :edit, :update, :complete, :destroy]
    before_action :set_project, only: [:new, :create, :edit, :show]
    
    
    
    
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
        #@task = Task.find(params[:id]
    end
    
    def new
        if @project
            @users = @project.users
        end
        @task = Task.new
        @projects = current_user.projects
        
     
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
       # @task = Task.find(params[:id])
        is_task_owner(:edit)
        if @project
        @users = @project.users
        end 
        @projects = current_user.projects
        
    end 
    
    def update
       #  @task = Task.find(params[:id])
       if @task.user == current_user
       
         @task.update(task_params)
         redirect_to @task
     else
        #you can't do that 
     end
    end
    
    def complete
        #@task = Task.Find(params[:id])
        @task.update(task_params(:complete))
        redirect_to @task
    end 
    
    def destroy
        #@task = Task.find(params[:id])
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
           if project_id
               @nested = true
               @project = Project.find(project_id)
           else
            if @task
               @project = @task.project
           end 
           end
    end
    
    def find_task
        @task = Task.find(params[:id])
    end 
end
