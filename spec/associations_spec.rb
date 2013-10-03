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
	it { should have_many(:politicians).through(:politician_teams) }
end

describe Politician do
	it { should have_many(:teams).through(:politician_teams) }
  it { should have_many(:scores)}
end

describe Score do
  it { should belong_to(:politician)}
  it { should validate_presence_of(:game_number)}
end
