class Technology < ApplicationRecord
  belongs_to :job

  has_one_attached :icon
end
