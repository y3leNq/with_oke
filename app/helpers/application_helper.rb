module ApplicationHelper
  def turbo_stream_flash
    turbo_stream.update 'flash_message', partial: 'shared/flash_messages'
  end

  def highest_score(song)
    current_user.scores.where(song_id: song).maximum(:score)
  end
end
