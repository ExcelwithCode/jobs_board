require "spec_helper"
require "rails_helper"

feature "view an individual job listing" do
  before do
    @job_1 = FactoryGirl.create(:job, title: "Copywriter", location: "New York, NY")
  end
  
  scenario "user visits an invidual job page" do
    visit job_url(@job_1)
    
    expect(page).to have_text("Copywriter")
    expect(page).to have_text("New York, NY")
  end
end