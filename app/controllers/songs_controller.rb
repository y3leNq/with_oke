class SongsController < ApplicationController
  def index
    if params[:search].present?
      @songs = Song.search(params[:search])
    else
      @songs = []
    end
  end

  def search; end
end
