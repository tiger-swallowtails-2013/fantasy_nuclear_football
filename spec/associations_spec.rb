require_relative './spec_helper'

describe User do
	it { should validate_presence_of(:username) }
	it { should validate_uniqueness_of(:email) }
	it { should validate_uniqueness_of(:username) }
	it { should validate_uniqueness_of(:facebook_id) }
	it { should have_many(:teams) }
	it { should have_many(:leagues).through(:teams) }
end

describe League do
	it { should validate_presence_of(:name) }
	it { should have_many(:teams) }
	it { should have_many(:users).through(:teams) }
end

describe Team do
	it { should validate_presence_of(:name) }
	it { should belong_to(:user) }
	it { should belong_to(:league) }
end

describe Politician do
end
