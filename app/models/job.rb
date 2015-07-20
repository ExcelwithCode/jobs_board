class Job < ActiveRecord::Base
  include Payola::Sellable
   
  validates :title, :category, :location, :description, :to_apply, presence: true
  validates :title, length: { maximum: 75 }
  validates :description, length: { minimum: 500 }
  validates :to_apply, length: { maximum: 500 }
  
  before_validation :provide_name, :provide_permalink
  
  private
  
  def provide_name
    self.name = "#{self.title} at #{self.category}"
  end
  
  def provide_permalink
    self.permalink = "#{title} #{ SecureRandom.hex }".parameterize
  end
end
