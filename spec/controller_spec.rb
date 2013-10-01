require_relative '../app/controllers/index.rb'
require_relative './spec_helper'


describe "homepage" do
  include Spec

  before(:each) do
    get '/'
    @test_user = create_test_user
  end

  it "should exist" do
    expect(last_response).to be_ok
  end

  after(:each) do
    @test_user.destroy
  end

end

describe 'user page' do
  include Spec

  before(:each) do
    @test_user = create_test_user
    get "/users/#{@test_user.id}"
  end

  after(:each) do
    @test_user.destroy
  end

  it "should have a page for each user" do
    expect(last_response).to be_ok
  end



end




