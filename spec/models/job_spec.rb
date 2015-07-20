require "spec_helper"
require "rails_helper"

describe Job, "create factory" do
  it "has a valid factory" do
    expect(FactoryGirl.build(:job)).to be_valid
  end
end

describe Job, '.description' do
  it { should validate_presence_of(:description) }
  it { should validate_length_of(:description).is_at_least(500) }
end

describe Job, '.title' do
  it { should validate_presence_of(:title) }
  it { should validate_length_of(:title).is_at_most(75) }
end

describe Job, '.to_apply' do
  it { should validate_presence_of(:to_apply) }
  it { should validate_length_of(:to_apply).is_at_most(500) }
end

describe Job, "all other attributes must be present" do
  it { should validate_presence_of(:category) }
  it { should validate_presence_of(:location) }
end