class Job < ApplicationRecord
  belongs_to :category
  has_many :jobs_technologies
  has_many :technologies, through: :jobs_technologies
  accepts_nested_attributes_for :technologies
end
