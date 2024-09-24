module TasksHelper
    def render_error(task)
        render json: { error: @task.errors.full_messages },status: :unprocessable_entity
    end
end
