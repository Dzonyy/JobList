class Technology < ApplicationRecord
  has_many :jobs
  has_many :jobs, through: :jobs_technologies

  has_one_attached :icon
end
