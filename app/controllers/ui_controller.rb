class UiController < ApplicationController
  before_action do
    redirect_to :root if Rails.env.production?
  end

  #layout "application"

  def index
  end

  def convocations
  end

  def investigations
  end

  def flags
  end

  def restrictions
  end

  def citizens
  end

  def convictions
  end

  def home
  end

  def admin
  end
end

