class AdminsController < ApplicationController
  before_action :require_admin

  def index
    @active_tab = 'dashboard'
    @requests = Agent.where(verification_status: false)
  end

  def verify_agent
    puts 'whats going on'
    puts params[:param]
  end

  def update
  end
end
