class SongsController < ApplicationController
  before_action :set_song, only: %i[show edit update destroy]

  def index
    @songs = Song.top_songs
  end

  def new
    @song = Song.new

    if params[:track_id].present?
      track_info = Song.lookup(params[:track_id])
      @song.title = track_info[0]['trackName']
      @song.artist = track_info[0]['artistName']
      @song.preview_url = track_info[0]['previewUrl']
    elsif params[:song_id].present?
      song = Song.find(params[:song_id])
      @song.id = song.id
      @song.title = song.title
      @song.artist = song.artist
      @song.preview_url = song.preview_url
    end
  end

  def create
    @playlist = Playlist.find(params[:song][:playlist_id])
    @song = Song.find_or_initialize_by(song_params)
    if @song.persisted? || @song.save
      playlist_song = @song.playlist_songs.build(playlist: @playlist, key: params[:song][:key])
      if playlist_song.save
        flash.now[:info] = (t '.success', item: @playlist.name)
      else
        flash.now[:danger] = (t '.fail')
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    if @song.update(song_params) && @song.playlist_songs.update(key: params[:song][:key])
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
    params.require(:song).permit(:artist, :title, :preview_url)
  end

  def set_song
    @playlist = current_user.playlists.find(params[:playlist_id])
    @song = @playlist.songs.find(params[:id])
  end
end
