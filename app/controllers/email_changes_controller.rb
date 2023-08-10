class EmailChangesController < ApplicationController
  def new; end

  def create
    @user = User.find(current_user.id)
    @user.unconfirmed_email = params[:unconfirmed_email]
    @user.email_token = SecureRandom.hex(10)
    @user.email_token_expires_at = 1.hour.from_now
    if @user.save
      UserMailer.change_email(@user).deliver_now
      redirect_to profile_path, info: (t '.success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find_by(email_token: params[:id])

    if @user && @user.email_token_expires_at > Time.current && @user.email_change
      redirect_to root_path, info: (t '.success')
    else
      redirect_to root_path, danger: (t '.fail')
    end
  end
end
