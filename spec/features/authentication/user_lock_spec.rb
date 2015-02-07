require 'spec_helper'

feature 'User Lock' do
  # include_examples 'page for authentication', :new_user_unlock_path,
    # 'Resend unlock instructions'

  scenario 'An user gets locked after 5 failed sign in attemps' do
  end

  scenario 'After 1 hour the locked user will be auto unlocked' do
  end

  scenario 'After visiting emailed link the locked user will be unlocked' do
  end
end
