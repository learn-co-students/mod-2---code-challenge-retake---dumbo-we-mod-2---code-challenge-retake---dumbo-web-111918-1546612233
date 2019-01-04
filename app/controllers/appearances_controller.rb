class AppearancesController < ApplicationController
before_action :appearances_params, only: :create
  def new
    @appearance = Appearance.new
    @guests = Guest.all
    @episodes = Episode.all
  end

  def create
    @appearance = Appearance.new(appearances_params)
    if @appearance.valid?
      @appearance.save
      redirect_to episode_path(@appearance.episode)
    else
      render :new
    end
  end

  private

  def appearances_params
    params.require(:appearance).permit(:guest_id, :episode_id, :rating)
  end
end
