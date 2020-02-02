class RemoveCompanyAddress1AndCompanyAddress2FromJobs < ActiveRecord::Migration[5.2]
  def change
    remove_column :jobs, :company_address1, :string
    remove_column :jobs, :company_address2, :string
  end
end
