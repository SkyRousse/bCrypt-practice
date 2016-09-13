require 'rails_helper'

describe 'adding posts process' do
  it 'assigns a newly created user as @user' do
    post :create, {:user => valid_attributes}, valid_session
    assigns(:user).should be_a(User)
    assign(:user).should be_persisted
  end

end
