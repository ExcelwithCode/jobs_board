class AddCompanyDetailsToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :email, :string
    add_column :jobs, :website, :string
    add_column :jobs, :company_name, :string
  end
end
