class AddRatingToJobTechnologies < ActiveRecord::Migration[5.2]
  def change
    add_column :job_technologies, :rating, :integer
  end
end
