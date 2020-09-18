class User < ApplicationRecord
  has_secure_password

  has_many :events
  has_many :performances
  has_many :comments

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  VALID_PHONE_REGEX=/\A[6-9][0-9]{9}\z/.freeze

  validates :name, length: { in: 3..50 }
  validates :email, format: { with: VALID_EMAIL_REGEX }, length: { in: 7..50 }
  validates :mobile, format: { with: VALID_PHONE_REGEX }, length: { is: 10 }
  validates_presence_of :name, :email, :mobile
  validates_presence_of :password, on: create
  validates_uniqueness_of :email, :mobile

  def self.generate_auth_token(column, user)
    user[column] = SecureRandom.urlsafe_base64
    user.save!
  end
end
