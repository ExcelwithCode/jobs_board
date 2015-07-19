require "spec_helper"
require "rails_helper"

describe Job, "create factory" do
  it "has a valid factory" do
    expect(FactoryGirl.build(:job)).to be_valid
  end
end

describe Job, "all attributes must be present" do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:category) }
  it { should validate_presence_of(:location) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:to_apply) }
end