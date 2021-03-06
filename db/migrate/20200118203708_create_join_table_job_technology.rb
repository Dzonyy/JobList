class CreateJoinTableJobTechnology < ActiveRecord::Migration[5.2]
  def change
    create_join_table :job, :technologies do |t|
      t.index [:job_id, :technology_id]
      t.index [:technology_id, :job_id]
    end
  end
end
