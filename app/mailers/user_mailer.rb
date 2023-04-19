class UserMailer < Devise::Mailer

  def confirmation_instructions(record, token, opts={})
    @token = token
    devise_mail(record, :confirmation_instructions, opts)
  end

  def welcome_email(user)
    @user = user
    mail(to: @user.email, from: "recrutingbackground@gmail.com", subject: 'Welcome to My Awesome Site')
  end

end
