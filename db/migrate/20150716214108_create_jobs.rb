class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :category
      t.string :location
      t.text :description
      t.text :to_apply

      t.timestamps null: false
    end
  end
end
