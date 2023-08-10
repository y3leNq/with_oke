class UserMailer < ApplicationMailer
  def reset_password_email(user)
    @user = User.find(user.id)
    @url  = edit_password_reset_url(@user.reset_password_token)
    mail(to: user.email,
         subject: (t 'defaults.password_reset'))
  end

  def change_email(user)
    @user = User.find(user.id)
    @url = email_change_url(@user.email_token)
    mail(to: user.unconfirmed_email,
         subject: (t 'defaults.email_change'))
  end
end
