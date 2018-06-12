class SessionsController < ApplicationController
  before_action :require_agent, only: [:destroy]

  def new
    redirect_to home_path if current_agent
  end

  def create
    agent = Agent.find_by(username: params[:username])

    if agent && agent.authenticate(params[:password])
      session[:agent_id] = agent.id
      redirect_to home_path, notice: "You have logged in! Nice time"
    else
      flash[:error] = "Invalid username or password"
      redirect_to sign_in_path
    end
  end

  def destroy
    session[:agent_id] = nil
    redirect_to root_path, notice: "You have signed out"
  end
end
