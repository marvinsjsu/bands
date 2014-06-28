class TracksController < ApplicationController

  def index
    @tracks = Track.find_by_album_id(params[:album_id])
    render :index, locals: {tracks: @tracks}
  end

  def show
    @track = Track.find(params[:id])
    render :show, locals: {track: @track}
  end

  def new
   @track = Track.new
   @current_album = Album.find(params[:album_id])
   @albums = Album.where("band_id = ?", @current_album.band_id)

   render :new, locals: { track: @track, current_album: @current_album, albums: @albums }
  end

  def create
   @track = Track.new(track_params)

   if @track.save
     redirect_to album_url(@track.album_id)
   else
     flash[:errors] = @track.errors.messages
     render :new, locals: {track: @track}
   end
  end

  def edit
    @track = Track.find(params[:id])
    @current_album = Album.find(params[:album_id])
    @band = Band.find(@current_album.band_id)
    render :edit, locals: {track: @track, current_album: @current_album, band: @band}
  end

  def update
    @track = Track.find(params[:id])
    @track.update_attributes(track_params)

    if @track.save
      redirect_to album_url(@track.album_id)
    else
      flash[:errors] = @track.errors.messages
      render :edit, locals: {track: @track}
    end
  end

  def destroy

  end
end
