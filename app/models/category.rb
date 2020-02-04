class Category < ApplicationRecord
  has_many :jobs, dependent: :restrict_with_exception

  validates :name, presence: true
end
