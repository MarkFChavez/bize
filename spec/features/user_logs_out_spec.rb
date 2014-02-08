require 'spec_helper'

feature 'User logs out' do
  scenario 'on the dashboard' do
    user = create(:user)
    sign_in_as user.email, user.password

    click_on 'Logout'

    user_should_be_signed_out
  end
end
