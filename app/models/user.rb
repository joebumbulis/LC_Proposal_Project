class User < ApplicationRecord
  has_and_belongs_to_many :projects

  scope :admins, -> {where(admin: true).order(:username)}
  scope :clients, -> {where(admin: false).order(:username)}

  before_save { self.email = email.downcase}

  validates :username, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX},
            uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 8 }
end
