class ScoresController < ApplicationController
  def new
    @song = Song.find(params[:song_id])
    @score = Score.new
    hash = @song.scores.group_by { |score| score.key.to_s }.to_h
    @chart = hash.transform_values { |scores| scores.max_by(&:score).score }.sort_by { |key, _| key.to_f }
  end

  def create
    @song = Song.find(params[:song_id])
    @score = @song.scores.build(score_params)

    if @score.save
      redirect_to new_song_score_path(@song), info: (t '.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def score_params
    params.require(:score).permit(:score, :key).merge(user_id: current_user.id)
  end
end
