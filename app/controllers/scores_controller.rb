class ScoresController < ApplicationController
  before_action :set_song, only: %i[new create]

  def new
    @score = Score.new
    hash = @song.scores.group_by { |score| score.key.to_s }.to_h
    @chart = hash.transform_values { |scores| scores.max_by(&:score).score }.sort_by { |key, _| key.to_f }
  end

  def create
    @score = @song.scores.build(score_params)

    if @score.save
      hash = @song.scores.group_by { |score| score.key.to_s }.to_h
      @chart = hash.transform_values { |scores| scores.max_by(&:score).score }.sort_by { |key, _| key.to_f }
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
