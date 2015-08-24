class Job < ActiveRecord::Base
  include Payola::Sellable
   
  validates :title, :category, :location, :description, :company_name, :website, :email, :to_apply, presence: true
  validates :title, length: { maximum: 75 }
  validates :description, length: { minimum: 500 }
  validates :to_apply, length: { maximum: 500 }
  
  validates_formatting_of :email, using: :email
  validates_formatting_of :website, using: :url
  
  before_validation :provide_name, :provide_permalink
  
  def self.paid_ad
    where.not("stripeEmail" => nil).where.not("payola_sale_guid" => nil).where("created_at > ?", 60.days.ago)
  end
  
  def paid?
    (!(self.stripeEmail == nil) && !(self.payola_sale_guid == nil))
  end
  
  private
  
  def provide_name
    self.name = "excelwithcode" if self.name == nil
  end
  
  def provide_permalink
    self.permalink = "#{ self.name } #{ SecureRandom.hex }".parameterize if self.permalink == nil
  end
end