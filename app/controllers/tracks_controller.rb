class TracksController < ApplicationController
  before_action :require_user!
  
  def show
    @track = Track.find(params[:id])

    render :show
  end

  def new
    @track = Track.new(album_id: params[:album_id])

    render :new
  end

  def create
    @track = Track.new(track_params)

    if @track.save!
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def edit
    @track = Track.find(params[:id])

    render :edit
  end

  def update
    @track = Track.find(params[:id])
    @track.update(track_params)

    if @track.save!
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
    end
  end

  def destroy
    @track = Track.find(params[:id])
    @album = @track.album
    @track.destroy!
    redirect_to album_url(@album)
  end

  private
  def track_params
    params.require(:track).permit(:album_id, :title, :ord, :bonus, :lyrics)
  end
end