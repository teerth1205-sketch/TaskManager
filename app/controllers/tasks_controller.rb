class TasksController < ApplicationController
    
    def index
        if params[:project_id]
            @project = Project.find(params[:project_id]).includes(:tasks)
            @tasks = @project.tasks
        elsif
            @user = User.find(params[:user_id])
            @tasks = @user.tasks
        else 
            redirect_to new_user_task_url(current_user.id)
        end
    end
    
    def new 
        
    end 
    
    def create 
       Task.create(task_params)
       redirect_to user_tasks_path
    end 
    
     private
 
    def task_params
        params.require(:task).permit(:title, :content, :date, :user_id, :project_id)
    end
end
