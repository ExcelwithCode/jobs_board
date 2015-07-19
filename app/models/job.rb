class Job < ActiveRecord::Base
  validates :title, :category, :location, :description, :to_apply, presence: true
  validates :title, length: { maximum: 75 }
  validates :description, length: { minimum: 500 }
  validates :to_apply, length: { maximum: 500 }
end
