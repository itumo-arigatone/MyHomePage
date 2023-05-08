class UserMailer < ApplicationMailer
  default from: 'noreply@example.com'

  def registration_confirmation(user)
    @user = user
    mail(to: user.email, subject: 'ユーザ登録が完了しました。')
  end

  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Account activation"
  end

  def password_reset
    @greeting = "Hi"
    mail to: "to@example.org"
  end
end
