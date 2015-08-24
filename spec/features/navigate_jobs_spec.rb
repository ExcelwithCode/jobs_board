require "spec_helper"
require "rails_helper"

feature "navigating jobs" do
  before { @job_2 = FactoryGirl.create(:job, stripeEmail: "payment@jobs.com", payola_sale_guid: "mumbojumbo") }
  
  scenario "navigate from a job's page to job listings" do
    visit job_path(@job_2)
    
    click_link "Back to all jobs"
    
    expect(current_path).to eql(jobs_path)
  end
  
  scenario "navigate from job listings to a job's page" do
    visit jobs_path
    
    click_link @job_2.title
    
    expect(current_path).to eql(job_path(@job_2))
  end
end