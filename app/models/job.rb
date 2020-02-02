class Job < ApplicationRecord
  belongs_to :category
  belongs_to :pricing

  has_many :job_technologies
  has_many :technologies, through: :job_technologies

  validates :name, presence: true
  validates :pricing, presence: true

  accepts_nested_attributes_for :job_technologies
  geocoded_by :address
  after_validation :geocode
end
