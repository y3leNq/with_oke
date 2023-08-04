module ApplicationHelper
  def turbo_stream_flash
    turbo_stream.update 'flashes', partial: 'shared/toast'
  end
end
