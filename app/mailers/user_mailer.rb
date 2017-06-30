class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_activation.subject
  #
  def account_activation(user)
    @user = user
    mail to: user.email, subject: 'Account activation'
  end
  def account_activation_impro(user)
    @user = user
    mail to: user.email, subject: 'Activation utilisateur calendrier improvisades'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Password reset"
  end
  def password_reset_impro(user)
    @user = user
    mail to: user.email, subject: "Reinitialisation mot de passe calendrier improvisades"
  end
end
