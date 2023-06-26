class SongsController < ApplicationController
  def index; end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to songs_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def search
    if params[:search].present?
      @songs = Song.search(params[:search])
    else
      @songs = []
    end
  end

  private

  def song_params
    params.require(:song).permit(:artist, :title)
  end
end
