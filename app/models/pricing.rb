class Pricing < ApplicationRecord
  belongs_to :job, optional: true

  validates :name, presence: true
  validates :price, presence: true
end
