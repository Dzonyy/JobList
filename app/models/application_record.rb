class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def can_delete?
    true
  end
end
