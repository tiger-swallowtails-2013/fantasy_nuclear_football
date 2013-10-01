require_relative './spec_helper'

describe User do
	it { should validate_presence_of(:firstname) }
	it { should validate_presence_of(:lastname) }
	it { should validate_presence_of(:username) }
	it { should validate_presence_of(:email) }
	it { should validate_presence_of(:password) }
	it { should validate_presence_of(:facebook_id) }
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
end
