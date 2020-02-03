class Technology < ApplicationRecord
  has_many :job_technologies
  has_many :job, through: :job_technologies

  has_one_attached :icon
end
