class SongsController < ApplicationController
  def index; end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params.except(:playlist_id))
    @playlist = Playlist.find(params[:song][:playlist_id])

    begin
      ActiveRecord::Base.transaction do
        @song.save!
        @playlist.songs << @song
      end
      flash[:info] = t('.success', item: @playlist.name)
      redirect_to @playlist
    rescue ActiveRecord::RecordInvalid
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
    params.require(:song).permit(:artist, :title, :playlist_id)
  end
end
