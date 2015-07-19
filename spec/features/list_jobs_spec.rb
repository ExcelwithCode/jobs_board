require "spec_helper"
require "rails_helper"

feature "view all job listings" do
  before do
    @job_1 = FactoryGirl.create(:job, title: "Senior Copywriter")
    @job_2 = FactoryGirl.create(:job, title: "UX Designer")
    @job_3 = FactoryGirl.create(:job, title: "Data Scientist")
  end
  
  scenario "user visits jobs page" do
    visit "/jobs"
    
    expect(page).to have_text("Senior Copywriter")
    expect(page).to have_text("UX Designer")
    expect(page).to have_text("Data Scientist")
  end
end