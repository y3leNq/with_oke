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
      redirect_to root_path, info: "Logged in from #{provider.titleize}!"
    else
      begin
        @user = create_from(provider)
        # NOTE: this is the place to add '@user.activate!' if you are using user_activation submodule

        reset_session # protect from session fixation attack
        auto_login(@user)
        redirect_to root_path, info: (t '.success')
      rescue
        redirect_to root_path, danger: (t '.fail')
      end
    end
  end
end

