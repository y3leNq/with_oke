class PlaylistsController < ApplicationController
  before_action :set_playlist, only: %i[edit update destroy]

  def index
    @playlists = Playlist.all
  end

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = current_user.playlists.build(playlist_params)
    if @playlist.save
      redirect_to playlists_path, info: (t '.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @playlist.update(playlist_params)
      redirect_to playlists_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @playlist.destroy
    redirect_to playlists_path, info: (t '.success')
  end

  private

  def playlist_params
    params.require(:playlist).permit(:name)
  end

  def set_playlist
    @playlist = current_user.playlists.find(params[:id])
  end
end
