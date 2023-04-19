class WelcomeEmailJob < ApplicationJob
  queue_as :default

  def perform    
    users = User.where(welcome_email_sent_at: nil)
    users.each do |user|
      UserMailer.welcome_email(user).deliver_now
      user.update(welcome_email_sent_at: Time.now)
    end
  end
end