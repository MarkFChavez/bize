require 'spec_helper'

feature 'User creates a project' do
  scenario 'without a name' do
    sign_in
    click_on 'Create new project'

    fill_in 'Name', with: ''
    click_on 'Create project'

    expect(page).to have_content "can't be blank"
  end

  scenario 'with a name' do
    sign_in
    click_on 'Create new project'

    fill_in 'Name', with: 'Sample project'
    click_on 'Create project'

    expect(page).to have_css '.flash', text: 'Project has been created successfully'
    expect(page).to have_css '.project', text: 'Sample project'
  end

  scenario 'with an already existing name' do
    user = create(:user)
    project = create(:project, user: user)
    sign_in_as user.email, user.password
    click_on 'Create new project'

    fill_in 'Name', with: project.name
    click_on 'Create project'

    expect(page).to have_content "has already been taken"
  end
end
