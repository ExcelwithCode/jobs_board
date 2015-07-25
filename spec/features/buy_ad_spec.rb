require 'spec_helper'
require 'rails_helper'

feature "process payments for ads" do
  before { @job = FactoryGirl.create(:job) }
  
  scenario "user sees the payment form" do
    visit buy_ad_path(@job.permalink)
    
    expect(page).to have_button("PAY AND DISPLAY AD NOW")
  end
  
  scenario "payment succeeds"
  # do
  #   visit buy_ad_path(@job.permalink)
    
  #   fill_in("Your email address", with:"July24@gmail.com")
  #   fill_in("Card number", with:"4000056655665556")
  #   fill_in("Exp Month", with: "03")
  #   fill_in("Exp Year", with: "2019")
  #   fill_in("CVC Code", with: "768")
    
  #   click_button("PAY AND DISPLAY AD NOW")
    
  #   expect(page).to have_text(@job.title)
  # end
end
