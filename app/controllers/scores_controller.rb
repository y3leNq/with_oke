class ScoresController < ApplicationController
  def new
    @song = Song.find(params[:song_id])
    @score = Score.new
  end

  def create
    @song = Song.find(params[:song_id])
    @score = @song.scores.build(score_params)

    if @score.save
      redirect_to new_song_score_path(@song), info: (t '.success')
    else
      render :new
    end
  end

  private

  def score_params
    params.require(:score).permit(:score, :key).merge(user_id: current_user.id)
  end
end