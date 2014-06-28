class BandsController < ApplicationController

  def index
    @bands = Band.all
    render :index, locals: {bands: @bands}
  end

  def show
    @band = Band.find(params[:id])
    render :show, locals: {band: @band}
  end

  def new
    @band = Band.new
    render :new, locals: {band: @band}
  end

  def create
    @band = Band.new(band_params)
    if @band.save

      redirect_to bands_url
    else
      flash[:errors] = @band.errors.messages
      render :new, locals: {band: @band}
    end
  end

  def edit
    @band = Band.find(params[:id])
    render :edit, locals: {band: @band}
  end

  def update
    @band = Band.find(params[:id])
    @band.update_attributes(band_params)

    if @band.save
      redirect_to bands_url
    else
      flash[:errors] = @band.errors.messages
      render :edit, locals: {band: @band}
    end
  end

  def destroy
    @band = Band.find(params[:id])
    @band.destroy
    redirect_to bands_url
  end
end
