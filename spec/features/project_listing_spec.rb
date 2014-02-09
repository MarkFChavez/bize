require 'spec_helper'

feature 'Project listing' do
  scenario 'shows the accessible projects' do
    user1 = create(:user, email: 'user1@gmail.com')
    user2 = create(:user, email: 'user2@gmail.com')
    project1 = create(:project, name: "Project A", user: user1)
    project2 = create(:project, name: "Project B", user: user1)
    project3 = create(:project, name: "Project C", user: user2)
    sign_in_as user1.email, user1.password

    within('#projects') do
      expect(page).to have_css '.project', text: project1.name
      expect(page).to have_css '.project', text: project2.name
      expect(page).to_not have_css '.project', text: project3.name
    end
  end
end
