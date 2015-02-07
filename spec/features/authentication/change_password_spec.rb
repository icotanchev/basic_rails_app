# require 'spec_helper'

# feature 'Change password' do
#   include AuthHelper

#   scenario 'An user can change successfully password with valid params' do
#     create(:user, :john_doe)

#     visit new_user_session_path

#     fill_signin_form_with username: 'john.doe@emp.com', password: 'john:doe75'

#     click_link 'Log Out'
    
#     expect(current_path).to eq new_user_session_path

#     fill_in :user_current_password, with: 'john:doe75' 
#     fill_in :user_password, with: 'Test1234!!!!'
#     fill_in :user_password_confirmation, with: 'Test1234!!!!'

#     click_button 'Update'

#     expect(current_path).to eq root_path

#     click_link 'Log Out'
    
#     expect(current_path).to eq new_user_session_path

#     fill_signin_form_with username: 'john.doe@emp.com', password: 'john:doe75'
#     expect(current_path).to eq new_user_session_path

#     fill_signin_form_with username: 'john.doe@emp.com', password: 'Test1234!!!!'
#     expect(current_path).to eq root_path
#   end

#   scenario 'An user can not change password with invalid password confirmation' do
#     create(:user, :john_doe)

#     visit new_user_session_path

#     fill_signin_form_with username: 'john.doe@emp.com', password: 'john:doe75'

#     click_link 'Log Out'
    
#     expect(current_path).to eq edit_user_registration_path

#     fill_in :user_current_password, with: 'john:doe75' 
#     fill_in :user_password, with: 'Test1234!!!!'
#     fill_in :user_password_confirmation, with: :invalid_password

#     click_button 'Update'

#     expect(page).to have_text 'Password doesn\'t match confirmation'
#   end

#   scenario 'An user can not change password with invalid current password' do
#     create(:user, :john_doe)

#     visit new_user_session_path

#     fill_signin_form_with username: 'john.doe@emp.com', password: 'john:doe75'

#     click_link 'Log Out'
    
#     expect(current_path).to eq edit_user_registration_path

#     fill_in :user_current_password, with: :invalid_current_password 
#     fill_in :user_password, with: 'Test1234!!!!'
#     fill_in :user_password_confirmation, with: 'Test1234!!!!'

#     click_button 'Update'

#     expect(page).to have_text 'Current password is invalid'
#   end

#   scenario 'An user can not change password when new password is less than 10 characters' do
#     create(:user, :john_doe)

#     visit new_user_session_path

#     fill_signin_form_with username: 'john.doe@emp.com', password: 'john:doe75'

#     click_link 'Log Out'
    
#     expect(current_path).to eq edit_user_registration_path

#     fill_in :user_current_password, with: 'john:doe75'
#     fill_in :user_password, with: 'SmallPass'
#     fill_in :user_password_confirmation, with: 'SmallPass'

#     click_button 'Update'

#     expect(page).to have_text 'Password is too short (minimum is 10 characters)'
#   end
# end
