class ScoresController < ApplicationController
  before_action :set_song, only: %i[new create]

  def new
    @score = Score.new
    @chart = current_user.score_chart(@song)
  end

  def create
    @score = @song.scores.build(score_params)

    if @score.save
      @chart = current_user.score_chart(@song)
      flash.now[:info] = (t '.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_song
    @song = Song.find(params[:song_id])
  end

  def score_params
    params.require(:score).permit(:score, :key).merge(user_id: current_user.id)
  end
end
