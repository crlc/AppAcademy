class TracksController < ApplicationController
  before_action :require_user!

  def new
    @track = Track.new
    @albums = Album.all
    render :new
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to track_url(@track.id)
    else
      flash.now[:errors]  =@track.errors.full_messages
      @albums = Album.all
      render :new
    end
  end

  def show
    @track = Track.find(params[:id])
    @notes = Note.all
    render :show
  end

  def edit
    @track = Track.find(params[:id])
    @albums = Album.all
    render :new
  end

  def update
    @track = Track.find(params[:id])
    @track.update(track_params)
    redirect_to track_url(@track.id)
  end

  def destroy
    @track = Track.find(params[:id])
    @track.destroy!

    redirect_to bands_url
  end

  private

  def track_params
    params.require(:track).permit(:song, :side, :lyrics, :album_id)
  end
end
