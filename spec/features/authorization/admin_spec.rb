require 'spec_helper'

feature 'Authorization' do

  scenario 'Admin abilities' do
    visit_protected(root_path, :admin, 'admin@test.com', 'test123456')

    within('.alert.alert-notice') { expect(page).to have_text 'Signed in successfully.' }
  end

  scenario 'Standard user abilities' do
    visit_protected(root_path, :john_doe, 'john.doe@emp.com', 'john:doe75')

    within('.alert.alert-notice') { expect(page).to have_text 'Signed in successfully.' }
  end

  private

  def fill_signin_form_with(params)
    within 'form#new_user' do
      fill_in 'user_email', with: params[:username]
      fill_in 'user_password', with: params[:password]
      click_button 'Sign in'
    end
  end

  def visit_protected(path, user_type, user_name, password)
    create(:user, user_type)

    visit path

    fill_signin_form_with username: user_name, password: password

    expect(current_path).to eq path
  end
end
