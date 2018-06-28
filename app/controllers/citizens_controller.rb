class CitizensController < ApplicationController
  before_action :require_agent, except: [:background_history]
  skip_before_action :verify_authenticity_token, only: [:background_history]
  
  def index
    @citizens = Citizen.with_attached_avatar.all
  end

  def new
    @citizen = Citizen.new
  end

  def create
    @citizen = Citizen.new(citizen_params)

    if @citizen.save
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
      @citizens = Citizen.ransack(full_name_cont_all: @query.split(' ')).result
    end
  end

  def background_history
    the_one = citizen_finder(Citizen.sanitize_sql_like(params[:query])).first
    citizen_history = generate_history(the_one)
    respond_to do |f|
      f.json { render json: citizen_history }
    end
  end

  private

  def citizen_finder(query)
    citizens = query.scan(/\D/).empty? ?
    Citizen.where(id_card_number: query).or(Citizen.where(telephone: query)).with_attached_avatar :
    Citizen.ransack(full_name_cont_all: query.split(' ')).result
  end

  def citizen_params
    params.require(:citizen).permit(:avatar, :surname, :given_names, :date_of_birth, 
                                    :born_at, :father, :mother, :occupation, :address, 
                                    :height, :sex, :sp, :date_issued, :expiry_date, :id_card_number)
  end

  def generate_history(the_one)
    history = { id: {}};
    if the_one
      citizen = CitizenSerializer.new(the_one).serializable_hash
      citizen[:data][:attributes][:avatar] = url_for(citizen[:data][:attributes][:avatar])
      citizen[:data][:attributes].each do |key, value|
        if key.to_s == 'flags' || key.to_s == 'restrictions'
          history[key] = citizen[:data][:attributes][key]
        else
          history[:id][key] = citizen[:data][:attributes][key]
        end
      end
    else
      history = {id: {}, restrictions: [], flags: []}
    end
    return history
  end
end

