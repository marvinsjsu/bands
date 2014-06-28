class AlbumsController < ApplicationController
  def index
    @albums = Album.all
    render :index, locals: {albums: @albums}
  end

  def show
    @album = Album.find(params[:id])
    render :show, locals: {album: @album}
  end

  def new
    @album = Album.new
    @bands = Band.all
    @current_band = Band.find(params[:band_id])
    render :new, locals: {album: @album, bands: @bands, current_band: @current_band}
  end

  def create
    @album = Album.new(album_params)

    if @album.save
      redirect_to band_url(@album.band_id)
    else
      flash[:errors] = @album.errors.messages
      render :new, locals: {album: @album}
    end
  end

  def edit
    @album = Album.find(params[:id])
    @bands = Band.all
    render :edit, locals: {album: @album, bands: @bands}
  end

  def update
    @album.update_attributes(album_params)
    if @album.save
      flash[:errors] = @album.errors.messages
      render :edit, locals: {album: @album}
    else
      redirect_to band_albums_url(@album.band_id)
    end
  end

  def destroy

  end
end
