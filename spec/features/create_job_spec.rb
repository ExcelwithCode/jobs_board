require "spec_helper"
require "rails_helper"

feature "create a new job listing" do
  scenario "user visits job form" do
    visit root_path
    click_link "Post a job: $200 for 60 days"
    
    expect(page).to have_text("STEP 1 (OF 3): CREATE YOUR AD")
    expect(page).to have_button("Continue to Step 2 to preview your ad")
  end
  
  scenario "user completes job form" do
    visit new_job_path
    
    fill_in("What's the job title?", with: "Rails Programmer" )
    find("option[value='Product Development']").select_option
    fill_in("Describe the responsibilities and requirements for this job.", with: "#{Faker::Lorem.sentence(200)}")
    fill_in("How do people apply for this job?", with: "Shoot us an email with your salary requirements.")
    fill_in("What's the name of your company", with: "Dev Center")
    fill_in("Where's your company's headquarters?", with: "Denver, CO")
    fill_in("Your company's website", with:"http://www.mycompany.com")
    fill_in("Your email address, where we'll send your receipt and confirmation email", with: "example@email.com")
    
    
    click_button("Continue to Step 2 to preview your ad")
    
    expect(page).to have_text("STEP 2 (OF 3): PREVIEW YOUR AD")
    expect(page).to have_link("Looks great! Continue to Step 3")
    expect(page).to have_link("Make changes")
  end
end