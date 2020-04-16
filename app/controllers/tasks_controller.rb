class TasksController < ApplicationController
    before_action :set_project, only: [:new, :create]
    
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
        @users = User.all
        @task = Task.new
        @projects = Project.all
    end 
    
    def create
        if @project
            @task = @project.tasks.build(task_params)
        else
            @task = current_user
            .tasks.build(task_params)
        end
        if @task.save
            redirect_to @task
        else
            render :new
        end
    end 
    
     private
 
    def task_params
        params.require(:task).permit(:title, :content, :date, :user_id, :project_id)
    end
    
    def set_project
       project_id = params[:project_id]
        @project = Project.find(project_id) if project_id  
    end
end
