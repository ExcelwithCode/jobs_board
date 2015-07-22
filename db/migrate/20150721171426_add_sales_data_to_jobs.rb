class AddSalesDataToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :stripeEmail, :string
    add_column :jobs, :payola_sale_guid, :string
  end
end
