class SongsController < ApplicationController
  def index; end

  def search
    if params[:search].present?
      @songs = Song.search(params[:search])
    else
      @songs = []
    end
  end
end
