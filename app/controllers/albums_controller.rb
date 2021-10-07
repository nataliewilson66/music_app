class AlbumsController < ApplicationController
  before_action :require_user!

  def show
    @album = Album.find(params[:id])

    render :show
  end
  
  def new
    @album = Album.new(band_id: params[:band_id])

    render :new
  end

  def create
    @album = Album.new(album_params)

    if @album.save!
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])

    render :edit
  end

  def update
    @album = Album.find(params[:id])
    @album.update(album_params)

    if @album.save!
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @band = @album.band
    @album.destroy!
    redirect_to band_url(@band)
  end

  private
  def album_params
    params.require(:album).permit(:band_id, :title, :year, :studio_album)
  end
end