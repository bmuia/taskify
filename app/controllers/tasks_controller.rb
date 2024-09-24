class TasksController < ApplicationController
    include TasksHelper
    before_action :set_task, only:[:show,:update,:destroy]
    def index
        @tasks = Task.all
        render json: @tasks
    end

    def show
        render json: @ask
    end

    def new
        task = Task.new
        render json: task
    end

    def create
        @task = Task.new(task_params)
        if @task.save
            render json: @task, status: :created
        else
            render_error(@task)
        end
    end

    def update
        if @task = Task.update(task_params)
            render json: @task, status: :ok
        else
            render_error(@task)  
        end
    end

    def destroy
        @task.destroy
        head :no_content
    end

    private

    def task_params
        params.require(:task).permit(:title,:description)
    end

    def set_task
        @task = Task.find(params[:id])
    end

end
