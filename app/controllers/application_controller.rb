class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
    rescue_from ActiveRecord::RecordNotFound, with: :no_response
    
    before_action :configure_permitted_parameters, if: :devise_controller?
  
    private
  
    def no_response
      render json: { error: "Not found" }, status: :not_found
    end
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute_name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:attribute_name])
    end
  end
  