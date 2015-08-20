require "spec_helper"
require "rails_helper"

describe Job, "create factory" do
  it "has a valid factory" do
    expect(FactoryGirl.build(:job)).to be_valid
  end
end

describe Job, '.description' do
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_length_of(:description).is_at_least(500) }
end

describe Job, '.title' do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_length_of(:title).is_at_most(75) }
end

describe Job, '.to_apply' do
  it { is_expected.to validate_presence_of(:to_apply) }
  it { is_expected.to validate_length_of(:to_apply).is_at_most(500) }
end

describe Job, "all other attributes must be present" do
  it { is_expected.to validate_presence_of(:category) }
  it { is_expected.to validate_presence_of(:location) }
  it { is_expected.to validate_presence_of(:company_name) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:website) }
end