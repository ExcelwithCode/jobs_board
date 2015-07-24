class Job < ActiveRecord::Base
  include Payola::Sellable
   
  validates :title, :category, :location, :description, :to_apply, presence: true
  validates :title, length: { maximum: 75 }
  validates :description, length: { minimum: 500 }
  validates :to_apply, length: { maximum: 500 }
  
  before_validation :provide_name, :provide_permalink
  
  def paid?
    (!(self.stripeEmail == nil) && !(self.payola_sale_guid == nil))
  end
  
  private
  
  def provide_name
    self.name = "workthedocs" if self.name == nil
  end
  
  def provide_permalink
    self.permalink = "#{ self.name } #{ SecureRandom.hex }".parameterize if self.permalink == nil
  end
end