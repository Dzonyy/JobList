class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :description
      t.string :address1
      t.string :address2
      t.string :phone_number
      t.string :city

      t.timestamps
    end
  end
end
