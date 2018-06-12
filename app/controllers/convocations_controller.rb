class ConvocationsController < ApplicationController
  before_action :require_agent
  
  def index
    @convocations = Convocation.where(agent: current_agent, status: false)
    @active_tab = 'convocations'
  end

  def show
    @convocation = Convocation.find(params[:id])
    @column = 'status'

    if params[:value] == 'status'
      @convocation.status = true
    else
      @column = 'honor_status'
      @convocation.honor_status = !@convocation.honor_status
    end

    if @convocation.save                
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

  def create
    @agent = current_agent
    @citizen = Citizen.find(params[:citizen_id])
    @convocation = Convocation.new(convocation_params)
    @convocation.agent = @agent 
    @convocation.station = @agent.station
    @convocation.citizen = @citizen
    @restriction = Restriction.new 
    @flag = Flag.new 
    @conviction = Conviction.new

    if @convocation.save
      flash[:notice] = 'The Convocation was added succesfully'
      redirect_to @citizen
    else
      @add_fail = 'convocation'
      # use flash.now[:notice] in this case when the reason for failure is due to lack of
      # rights to perform the action. Or you can try to let them know from the model
      # and add extra validation checks to attempt to resolve the issue

      render "citizens/show", anchor: '#new_convocation'
    end
  end

  def update
    @convocation = Convocation.find(params[:id])
    @column = 'status'

    if params[:value] == 'status'
      @convocation.status = !@convocation.status
    else
      @column = 'honor_status'
      @convocation.honor_status = !@convocation.honor_status
    end

    if @convocation.save
      archive_change(@column, @convocation)

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

  def convocation_params
    params.require(:convocation).permit(:reason, :convoker_id, :date_expected)
  end

  def archive_change(column, convocation)
    if column == 'honor_status'
      Archive.create(
        archive: convocation, 
        description: "changed the honor status from #{!@convocation.honor_status} to #{@convocation.honor_status}",
        agent_id: current_agent.id)
    elsif column == 'status'
      Archive.create(
        archive: convocation, 
        description: 'closed this convocation',
        agent_id: current_agent.id)
    end
  end
end


