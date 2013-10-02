require_relative './spec_helper'

describe User do
	it { should validate_presence_of(:username) }
	it { should validate_uniqueness_of(:email) }
	it { should validate_uniqueness_of(:username) }
	it { should validate_uniqueness_of(:facebook_id) }
	it { should have_many(:teams) }
end

describe Team do
	it { should validate_presence_of(:name) }
	it { should belong_to(:user) }
	it { should have_many(:politicians) }
end

describe Politician do
	it { should belong_to(:team) }
  it ( should have_many(:scores))
end

describe Score do
  it { should belong_to(:politician)}
end
