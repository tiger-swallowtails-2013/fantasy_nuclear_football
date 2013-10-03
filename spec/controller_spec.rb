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

feature 'team page' do
  # create_test_team
  scenario 'user can search by name' do
    visit('/teams/1')
    page.fill_in 'pol_name', with: 'John'
    page.click_button 'button'
    expect(page).to have_content('Sununu')
  end
end


