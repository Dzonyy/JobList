class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :name
      t.text :description
      t.string :salary_from
      t.string :salary_to
      t.string :experience
      t.string :company_name
      t.string :company_address1
      t.string :company_address2
      t.string :company_city
      t.string :company_phone_number

      t.timestamps
    end
  end
end
