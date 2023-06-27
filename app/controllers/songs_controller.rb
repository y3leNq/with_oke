class SongsController < ApplicationController
  def index; end

  def new
    @song = Song.new
  end

  def create
    @playlist = Playlist.find(params[:song][:playlist_id])
    @song = @playlist.songs.build(song_params.except(:playlist_id, :key))

    if @song.save
      @playlist.playlist_songs.create(song: @song, key: params[:song][:key])
      redirect_to @playlist, info: (t '.success', item: @playlist.name)
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
    params.require(:song).permit(:artist, :title, :key, :playlist_id)
  end
end
