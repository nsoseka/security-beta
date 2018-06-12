class RestrictionsController < ApplicationController
  before_action :require_agent
  
  def index
    @restrictions = Restriction.where(agent: current_agent, remove: false)
    @active_tab = 'restrictions'
  end

  def create
    @agent = current_agent
    @restriction = Restriction.new(restriction_params)
    @citizen = Citizen.find(params[:citizen_id])
    @restriction.agent = @agent
    @restriction.station = @agent.station 
    @restriction.citizen = @citizen 

    @convocation = Convocation.new
    @flag = Flag.new
    @conviction = Conviction.new

    if @restriction.save
      redirect_to @citizen
    else
      @add_fail = 'restriction'
      render "citizens/show", anchor: '#new_restriction'
    end
  end

  def update
    @restriction = Restriction.find(params[:id])
    @restriction.remove = true;

    if @restriction.save
      archive_change(@restriction)

      respond_to do |format|
        # format.html { render 'citizens/show' } ### todo
        format.js
      end
    else
      #@error = 'You don"t have rights to perform that action' ### todo

      respond_to do |format|
        format.js
      end
    end
  end

  private 

  def restriction_params
    params.require(:restriction).permit(:description, :genre)
  end

  def archive_change(restriction)
    Archive.create(
      archive: restriction,
      agent_id: current_agent.id, 
      description: 'removed the restriction')
  end
end


