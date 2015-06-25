class AlbumsController < ApplicationController
  before_action :require_user!

  def new
    @album = Album.new
    @bands = Band.all
    render :new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album.id)
    else
      flash.now[:errors] = @album.errors.full_messages
      @bands = Band.all
      render :new
    end
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def edit
    @album = Album.find(params[:id])
    @bands = Band.all
    render :new
  end

  def update
    @album = Album.find(params[:id])
    @album.update(album_params)
    redirect_to album_url(@album.id)
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy!

    redirect_to bands_url
  end

  private

  def album_params
    params.require(:album).permit(:title, :recorded, :band_id)
  end
end
