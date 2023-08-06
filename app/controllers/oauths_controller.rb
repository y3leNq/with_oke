# app/controllers/oauths_controller.rb
class OauthsController < ApplicationController
  skip_before_action :require_login, raise: false

  # sends the user on a trip to the provider,
  # and after authorizing there back to the callback url.
  def oauth
    login_at(params[:provider])
  end

  def callback
    provider = params[:provider]
    if @user = login_from(provider)
      redirect_to root_path, info: (t '.success')
    else
      @user = create_from(provider)
      reset_session
      auto_login(@user)
      redirect_to edit_user_path
    end
  end
end
