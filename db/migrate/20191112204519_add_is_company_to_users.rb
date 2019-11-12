class AddIsCompanyToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :is_company, :boolean, default: false
  end
end
