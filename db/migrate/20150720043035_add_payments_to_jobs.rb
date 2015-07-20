class AddPaymentsToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :name, :string
    add_column :jobs, :price, :integer, default: 20000
    add_column :jobs, :permalink, :string
  end
end
