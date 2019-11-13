class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :email
      t.string :password_digest

      t.timestamps
    end
    add_index :employees, :email, unique: true
  end
end
