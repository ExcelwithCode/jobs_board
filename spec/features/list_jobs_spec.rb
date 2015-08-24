require "spec_helper"
require "rails_helper"

feature "view all job listings" do
  before do
    @job_1 = FactoryGirl.create(:job, title: "Senior Copywriter", stripeEmail: "payment@jobs.com", payola_sale_guid: "mumbojumbo")
    @job_2 = FactoryGirl.create(:job, title: "UX Designer", stripeEmail: "payment@jobs.com", payola_sale_guid: "mumbojumbo")
    @job_3 = FactoryGirl.create(:job, title: "Data Scientist", stripeEmail: "payment@jobs.com", payola_sale_guid: "mumbojumbo")
  end
  
  scenario "user visits jobs page" do
    visit "/jobs"
    
    expect(page).to have_text("Senior Copywriter")
    expect(page).to have_text("UX Designer")
    expect(page).to have_text("Data Scientist")
  end
end