class Technology < ApplicationRecord
  has_many :jobs_technologies
  has_many :jobs, through: :jobs_technologies

  has_one_attached :icon
end
