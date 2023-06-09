class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new; end

  def create
    @user = login(params[:email], params[:password], params[:remember_me])
    if @user
      redirect_to root_path, info: (t '.success')
    else
      flash.now[:danger] = (t '.fail')
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to login_path, info: (t '.success')
  end
end
