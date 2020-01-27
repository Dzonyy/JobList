class Job < ApplicationRecord
  belongs_to :category

  has_many :job_technologies
  has_many :technologies, through: :job_technologies

  accepts_nested_attributes_for :job_technologies
  geocoded_by :address
  after_validation :geocode
end
