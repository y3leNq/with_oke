class PlaylistsController < ApplicationController
  before_action :set_playlist, only: %i[edit update destroy]

  def index
    @playlists = Playlist.all.order(created_at: :desc)
  end

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = current_user.playlists.build(playlist_params)
    if @playlist.save
      flash.now[:info] = (t '.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @playlist.update(playlist_params)
      flash.now[:info] = (t '.success')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @playlist.destroy
    flash.now[:info] = (t '.success')
  end

  private

  def playlist_params
    params.require(:playlist).permit(:name)
  end

  def set_playlist
    @playlist = current_user.playlists.find(params[:id])
  end
end
