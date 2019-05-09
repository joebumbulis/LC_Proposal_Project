class User < ApplicationRecord
  # has_many :projects_users
  # has_many :projects, through: :projects_users
  has_and_belongs_to_many :projects

  scope :admins, -> {where(admin: true).order(:username)}
  scope :clients, -> {where(admin: false).order(:username)}
end
