class Project < ApplicationRecord
  has_many :proposals
  # has_many :projects_users
  # has_many :users, through: :projects_users
  has_and_belongs_to_many :users


  validates :name, presence: { message: "must be included"}
  validates :slug, presence: true

  before_validation :to_slug

  def to_slug
    self.slug = name.parameterize.truncate(80, omission: '')
  end

  def to_param
    slug
  end
end
