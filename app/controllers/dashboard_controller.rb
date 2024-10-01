class DashboardController < ApplicationController
    before_action :authenticate_user!
  
    def index
      # Logic for dashboard
    end
  end
  