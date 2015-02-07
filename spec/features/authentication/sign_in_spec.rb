require 'spec_helper'

feature 'Sign In' do
  include AuthHelper

  # include_examples 'page for authentication', :new_user_session_path, 'Sign in'

  scenario 'An user signs in successfully with email and password' do
    create(:user, :john_doe)

    visit new_user_session_path

    expect(current_path).to eq new_user_session_path

    fill_signin_form_with username: 'john.doe@emp.com', password: 'john:doe75'

    expect(current_path).to eq root_path
    expect(page).to have_text 'Signed in successfully.'
    expect(page).to have_link 'Log Out', href: destroy_user_session_path
  end

  scenario 'An alert message is shown when entered credentials are not valid' do
    visit new_user_session_path

    expect(current_path).to eq new_user_session_path

    fill_signin_form_with username: 'invalid', password: 'invalid'

    expect(current_path).to eq new_user_session_path
    expect(page).to have_text 'Invalid email or password'
    expect(page).not_to have_link 'Sign out', href: destroy_user_session_path
  end
end
