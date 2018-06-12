class FlagsController < ApplicationController
  before_action :require_agent
  
  def index
    @flags = Flag.where(agent: current_agent, remove: false)
    @active_tab = 'flags'
  end

  def create
    @agent = current_agent
    @flag = Flag.new(flag_params)
    @citizen = Citizen.find(params[:citizen_id])
    @flag.citizen = @citizen
    @flag.agent = @agent
    @flag.station = @agent.station 

    @convocation = Convocation.new
    @restriction = Restriction.new
    @conviction = Conviction.new

    if @flag.save
      flash[:notice] = "Flag was added succesfully"
      redirect_to @citizen
    else
      @add_fail = 'flag'
      render "citizens/show", anchor: '#new_flag'
    end
  end

  # def show
  #   @flag = Flag.find(params[:id])
  #   @flag.remove = true;

  #   if @flag.save
  #     respond_to do |format|
  #       # format.html { render 'citizens/show' } ### todo
  #       format.js
  #     end
  #   else
  #     #@error = 'You don"t have rights to perform that action' ### todo

  #     respond_to do |format|
  #       format.js
  #     end
  #   end
  # end

  def update
    @flag = Flag.find(params[:id])
    @flag.remove = true;

    if @flag.save
      archive_change(@flag)
      
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

  def flag_params
    params.require(:flag).permit(:reason, :severity)
  end

  def archive_change(flag)
    Archive.create(archive: flag, agent_id: current_agent.id, description: 'removed the flag')
  end
end


