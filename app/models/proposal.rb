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

  before_validation :to_slug

  def to_slug
    slugified_name = name.parameterize.truncate(80, omission: '')
    if Proposal.where(slug: slugified_name).present?
      self.slug = "#{slugified_name}-#{id}"
    else
      self.slug = slugified_name
    end

  end

  def to_param
    slug
  end
end
