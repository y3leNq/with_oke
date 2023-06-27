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

  def edit
    @playlist = current_user.playlists.find(params[:playlist_id])
    @song = @playlist.songs.find(params[:id])
    @playlist_song = PlaylistSong.find_by(playlist_id: @playlist.id, song_id: @song.id)
  end

  def update
    @playlist = current_user.playlists.find(params[:playlist_id])
    @song = @playlist.songs.find(params[:id])

    if @song.update(song_params.except(:key, :playlist_id))
      redirect_to @playlist
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @playlist = current_user.playlists.find(params[:playlist_id])
    @song = @playlist.songs.find(params[:id])
    @song.destroy
    redirect_to @playlist, info: (t 'defaults.delete_playlist_song', item: @song.title)
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
