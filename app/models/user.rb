class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable, :confirmable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
         confirm_within: 3.days, # Change the time window for confirming an account (default is 2 days)
         reconfirmable: true, # Allow users to re-confirm their email address if they change it
         confirmation_keys: [:email]

  mount_uploader :avatar, AvatarUploader
  has_many :articles, foreign_key: :author_id, dependent: :destroy
  has_many :comments, dependent: :destroy

  def mailer
    UserMailer
  end

end
