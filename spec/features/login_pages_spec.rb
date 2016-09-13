require 'rails_helper'

describe 'the login and out process' do
  it 'logs a user in and out' do
    user = FactoryGirl.create(:user)
    visit new_login_path
    fill_in 'Email', :with => user.email
    fill_in "Password", :with => user.password
    click_on "signin"
    expect(page).to have_content 'You have been logged in'
    click_on "Log Out"
    expect(page).to have_content 'You have been logged out'
  end
  it "fails when attempting to log a user in" do
    visit new_login_path
    click_on "signin"
    expect(page).to have_content 'There was a problem logging in, please try again'
  end

end
