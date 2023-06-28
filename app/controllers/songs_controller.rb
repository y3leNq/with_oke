class SongsController < ApplicationController
  before_action :set_song, only: %i[edit update destroy]

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
    @playlist_song = @song.playlist_songs.find_by(playlist_id: @playlist.id)
  end

  def update
    if @song.update(song_params.except(:playlist_id, :key)) && @song.playlist_songs.update(playlist_id: params[:song][:playlist_id], key: params[:song][:key])
      redirect_to @playlist, info: (t '.success')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @song.destroy
    redirect_to @playlist, info: (t '.success', item: @song.title)
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

  def set_song
    @playlist = current_user.playlists.find(params[:playlist_id])
    @song = @playlist.songs.find(params[:id])
  end
end
