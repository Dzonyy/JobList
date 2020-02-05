class Pricing < ApplicationRecord
  has_many :jobs, dependent: :restrict_with_exception

  validates :name, presence: true
  validates :price, presence: true
end
