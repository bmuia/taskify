class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
    rescue_from ActiveRecord::RecordNotFound, with: :no_response

    private
    def no_response
        render json: { error: "Not found" }, status: :not_found
    end
end
