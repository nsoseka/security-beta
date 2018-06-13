class AgentsController < ApplicationController
  before_action :require_agent, except: [:new, :create]

  def index
    @agents = Agent.where(station_id: current_agent.station_id)
    @active_tab = 'agents'
  end

  def new
    @agent = Agent.new
  end

  def show
    @agent = current_agent
    @active_tab = 'user'
  end

  def edit
    @agent = Agent.find(params[:id])
  end

  def create
    @agent = Agent.new(agent_params)

    if @agent.save
      flash[:notice] = "Account was succesfully created," +
                        "once verified you will be able to access the platform"

      redirect_to sign_in_path
    else
      render 'agents/new'
    end
  end

  def update
    # allow agent to change their profile settings

    @agent = Agent.find(params[:id])
    @agent.verification_status = true

    if current_agent.role == 'admin'
      if @agent.update_attribute('verification_status', true)

        archive_change(@agent)

        respond_to do |format|
          # format.html { render 'citizens/show' } ### todo
          format.js
        end
      end
    elsif current_agent.id == params[:id]
      current_agent.destroy
      flash[:error] = "This agent request is now deleted"
      redirect_to root_path
    else
      session[:id] = nil
      redirect_to sign_in_path
    end
  end

  def destroy
    @agent = Agent.find(params[:id])

    if current_agent.role == 'admin'
      if @agent.destroy

        archive_change(@agent)

        respond_to do |format|
          # format.html { render 'citizens/show' } ### todo
          format.js
        end
      end
    elsif current_agent.id == params[:id]
      flash[:notice] = "Only the administrator is allowed to delete an account: Further attempts to delete your account can be prosecuted"
      redirect_to current_agent
    else
      current_agent.update_attribute('verification_status', false)
      flash[:error] = "This account has been placed under investigation for forgery and is now deactivated"
      session[:id] = nil
      redirect_to sign_in_path
    end

    binding.pry
  end

  private

  def agent_params
    params.require(:agent).permit(:id_card_number, :station_id, :username, :role, 
                                  :password, :password_confirmation, :full_name,
                                  :phone_number, :email, :service_id)
  end

  def archive_change(agent)
    Archive.create(archive: agent, agent_id: current_agent.id, description: "Verified the agent #{agent.id}")
  end
end
