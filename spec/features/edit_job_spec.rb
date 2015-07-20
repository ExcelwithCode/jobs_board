require "spec_helper"
require "rails_helper"

feature "make changes to job listings" do
  before do
    @job_3 = FactoryGirl.create(:job)
  end
  
  scenario "user visits job edit form" do
    visit edit_job_path(@job_3)
    
    expect(page).to have_content("STEP 1 (OF 3): CREATE YOUR AD")
    expect(page).to have_button("Continue to Step 2 to preview your ad")
  end
  
  scenario "user edits a job" do
    visit edit_job_path(@job_3)
    
    fill_in("Where's your company's headquarters?", with: "Detriot, MI")
    click_button("Continue to Step 2 to preview your ad")
    
    expect(page).to have_text("Detriot, MI")
  end
end