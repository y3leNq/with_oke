module ApplicationHelper
  def turbo_stream_flash
    turbo_stream.update 'flashes', partial: 'shared/toast'
  end

  def highest_score(song)
    current_user.scores.where(song_id: song).maximum(:score)
  end
end
