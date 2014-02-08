require 'spec_helper'

feature 'User logs in' do
  scenario 'using valid credentials' do
    user = create(:user)
    
    sign_in_as user.email, user.password

    user_should_be_signed_in
  end

  scenario 'using invalid credentials' do
    sign_in_as 'invalidemail@yahoo.com', 'invalidpassword'

    user_should_be_signed_out
  end
end
