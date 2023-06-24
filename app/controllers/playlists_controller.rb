class PlaylistsController < ApplicationController
  def index
    @playlists = Playlist.all
  end

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = current_user.playlists.build(playlist_params)
    if @playlist.save
      redirect_to playlists_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def playlist_params
    params.require(:playlist).permit(:name)
  end
end
