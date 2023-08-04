class SongsController < ApplicationController
  before_action :set_song, only: %i[show edit update destroy]

  def index; end

  def new
    @song = Song.new

    return unless params[:track_id].present?

    track_info = Song.lookup(params[:track_id])
    @song.title = track_info[0]['trackName']
    @song.artist = track_info[0]['artistName']
    @song.preview_url = track_info[0]['previewUrl']
  end

  def create
    playlist = Playlist.find(params[:song][:playlist_id])
    @song = Song.find_or_initialize_by(song_params.except(:key, :playlist_id))
    if @song.persisted? || @song.save
      playlist_song = @song.playlist_songs.build(playlist_id: playlist.id, key: params[:song][:key])
      if playlist_song.save
        flash.now[:info] = (t '.success', item: playlist.name)
      else
        flash.now[:danger] = (t '.fail')
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit
    @playlist_song = @song.playlist_songs.find_by(playlist_id: @playlist.id)
  end

  def update
    if @song.update(song_params.except(:playlist_id, :key)) &&
       @song.playlist_songs.update(playlist_id: params[:song][:playlist_id], key: params[:song][:key])
      flash.now[:info] = (t '.success')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @playlist.songs.destroy(@song)
    flash.now[:info] = (t '.success', item: @song.title)
  end

  def search
    if params[:search].present?
      result = Song.search(params[:search])
      @songs = result.uniq { |song| [song['trackName'], song['artistName']] }
    else
      @songs = []
    end
  end

  private

  def song_params
    params.require(:song).permit(:artist, :title, :key, :playlist_id, :preview_url)
  end

  def set_song
    @playlist = current_user.playlists.find(params[:playlist_id])
    @song = @playlist.songs.find(params[:id])
  end
end
