class PlaylistsController < ApplicationController
  before_action :set_playlist, only: %i[edit update destroy show]

  def index
    @playlists = current_user.playlists
  end

  def new
    @playlist = Playlist.new
  end

  def show
    @q = @playlist.songs.ransack(params[:q])
    @songs = @q.result.includes(:playlist_songs).distinct.page(params[:page])
  end

  def create
    @playlist = current_user.playlists.build(playlist_params)
    if @playlist.save
      flash.now[:info] = (t '.success')
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: 
          turbo_stream.prepend('playlists', @playlist) +
          turbo_stream.remove('no-result') +
          turbo_stream.update('flashes', partial: 'shared/toast')
        end
      end
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
    respond_to do |format|
      format.turbo_stream do
        render turbo_stream:
        current_user.playlists.empty? ? turbo_stream.update('playlists', partial: 'playlists/no_result') : turbo_stream.remove(@playlist) +
        turbo_stream.update('flashes', partial: 'shared/toast')
      end
    end
  end

  private

  def playlist_params
    params.require(:playlist).permit(:name)
  end

  def set_playlist
    @playlist = current_user.playlists.find(params[:id])
  end
end
