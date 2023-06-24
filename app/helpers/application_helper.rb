module ApplicationHelper
  def turbo_stream_flash
    turbo_stream.update 'flash_message', partial: 'shared/flash_messages'
  end
end
