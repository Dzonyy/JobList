class AddRatingToJobsTechnologies < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs_technologies, :rating, :integer
  end
end
