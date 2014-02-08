module AuthenticationHelpers
  def sign_in_as(email, password)
    visit root_path

    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_on 'Sign in'
  end

  def user_should_be_signed_in
    expect(page).to have_css 'a.logout', 'Logout'
  end

  def user_should_be_signed_out
    expect(page).to have_content "Sign in"
  end
end
