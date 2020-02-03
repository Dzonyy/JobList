class Technology < ApplicationRecord
  has_many :job_technologies
  has_many :job, through: :job_technologies

  has_one_attached :icon

  validates :name, presence: true
  # validates :color, presence: true
end
