class Proposal < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :project

  validates :name, presence: true
  validates :prepared_for, presence: true
  validates :prepared_by, presence: true
  validates :date_created, presence: true
  validates :project_goals, presence: true
  validates :project_implementation, presence: true
  validates :project_outline, presence: true
  validates :slug, presence: true

  before_save :to_slug

  def to_slug
    self.slug = name.parameterize.truncate(80, omission: '')
  end

  def to_param
    slug
  end
end
