require 'rails_helper'

describe 'the login and out process' do
  it 'logs a user in and then logs them out' do
    user = User.create(:email => "cory@gmailtest.com", :password => "coryspassword")
    visit new_login_path
    fill_in 'Email', :with => "cory@gmailtest.com"
    fill_in "Password", :with => "coryspassword"
    click_on "signin"
    expect(page).to have_content 'You have been logged in'
    click_on "Log Out"
    expect(page).to have_content 'You have been logged out'
  end

end
