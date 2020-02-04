class Job < ApplicationRecord
  belongs_to :category
  belongs_to :pricing

  extend FriendlyId
  friendly_id :name, use: :slugged

  has_one_attached :company_logo

  has_many :job_technologies
  has_many :technologies, through: :job_technologies

  validates :name, presence: true
  validates :pricing_id, presence: true
  validates :category, presence: true
  validates :salary_from, presence: true
  validates :salary_to, presence: true
  validates :experience, presence: true
  validates :address, presence: true
  validates :category_id, presence: true
  validates :company_name, presence: true
  validates :company_city, presence: true

  accepts_nested_attributes_for :job_technologies
  geocoded_by :address
  after_validation :geocode
end
