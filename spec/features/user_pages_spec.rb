require 'rails_helper'

describe 'creates a new user process' do
  it 'adds a new user to the database' do
    visit '/'
    click_on "Sign Up"
    fill_in 'Email', :with => "example@gmail.com"
    fill_in 'Password', :with => "12345678"
    click_on 'Create User'
    expect(page).to have_content 'welcome!'
  end
end
