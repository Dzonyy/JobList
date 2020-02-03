class AddAddressLatitudeLongitudeToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :address, :text
    add_column :jobs, :latitude, :float
    add_column :jobs, :longitude, :float
  end
end
