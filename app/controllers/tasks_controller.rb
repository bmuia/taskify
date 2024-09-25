class TasksController < ApplicationController
    include TasksHelper
    before_action :set_task, only: [:show, :update, :destroy]
  
    def index
      @tasks = Task.all
    end
  
    def show
    end
  
    def new
      @task = Task.new
    end
  
    def create
      @task = Task.new(task_params)
      if @task.save
        redirect_to tasks_path, notice: "Task successfully created"
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @task.update(task_params)
        redirect_to tasks_path, notice: "Task successfully updated"
      else
        render :edit
      end
    end
  
    def destroy
      @task.destroy
      redirect_to tasks_path, notice: "Task successfully deleted"
    end
  
    private
  
    def task_params
      params.require(:task).permit(:title, :description)
    end
  
    def set_task
      @task = Task.find(params[:id])
    end
  end
  