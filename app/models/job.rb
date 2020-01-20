class Job < ApplicationRecord
  belongs_to :category
  has_many :technologies, through: :jobs_technologies
end
