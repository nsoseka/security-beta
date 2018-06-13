class CitizensController < ApplicationController
  before_action :require_agent
  
  def index
    @citizens = Citizen.with_attached_avatar.all
    # flash.now[:notice] = "Successfully created..."
  end

  def new
    @citizen = Citizen.new
  end

  def create
    @citizen = Citizen.new(citizen_params)

    if @citizen.save
      #@citizen.avatar.attach(params[:citizen][:avatar])
      flash[:notice] = "Citizen was registered succesfully"
      redirect_to @citizen
    else
      render :new
    end
  end

  def show
    @citizen = Citizen.find(params[:id])
    @convocation = Convocation.new
    @restriction = Restriction.new 
    @flag = Flag.new 
    @conviction = Conviction.new
  end

  def edit
    @citizen = Citizen.find(params[:id])
  end

  def update
    @citizen = Citizen.find(params[:id])
    if params[:citizen][:avatar]
      flash[:notice] = 'Citizen Updated'
      @citizen.avatar.attach(params[:citizen][:avatar])
    else
      flash[:notice] = "You can only change the passport of a citizen and this itself requires some administrative procedure"
    end
    puts params[:citizen][:avatar]
    redirect_to home_path
  end

  def search
    @query = params[:search_query].strip.downcase
    criteria = params[:search_criteria].strip.downcase

    if @query.scan(/\D/).empty?
      @citizens = Citizen.where(id_card_number: @query).or(Citizen.where(telephone: @query)).with_attached_avatar
    else
      @citizens = Citizen.search_citizen(@query).with_attached_avatar
    end
  end

  private

  def citizen_params
    params.require(:citizen).permit(:avatar, :surname, :given_names, :date_of_birth, 
                                    :born_at, :father, :mother, :occupation, :address, 
                                    :height, :sex, :sp, :date_issued, :expiry_date, :id_card_number)
  end
end
