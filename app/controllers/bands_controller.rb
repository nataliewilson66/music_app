class BandsController < ApplicationController
  before_action :require_user!
  
  def index
    @bands = Band.all
    render :index
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.new(band_params)

    if @band.save!
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def update
    @band = Band.find(params[:id])
    @band.update(band_params)

    if @band.save!
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
    end
  end

  def destroy
    @band = Band.find(params[:id])
    @band.destroy!
    redirect_to users_url(current_user)
  end

  private
  def band_params
    params.require(:band).permit(:name)
  end
end