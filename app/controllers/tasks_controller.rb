class TasksController < ApplicationController
    
    def index
        if params[:project_id]
            @project = Project.find(params[:project_id]).includes(:tasks)
            @tasks = @project.tasks
        else
            @user = User.find(params[:user_id]).includes(:tasks)
            @tasks = @user.tasks
        else 
            redirect
        end
    end
end
