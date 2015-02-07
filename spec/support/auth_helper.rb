module AuthHelper
  def fill_signin_form_with(params)
    within 'form#new_user' do
      fill_in 'user_email', with: params[:username]
      fill_in 'user_password', with: params[:password]
      click_button 'Sign in'
    end
  end

  def visit_protected(path)
    create(:user, :john_doe)

    visit path

    fill_signin_form_with username: 'john.doe@emp.com', password: 'john:doe75'

    expect(current_path).to eq path
  end

  def visit_protected_as_admin(path)
    create(:user, :admin)

    visit path

    fill_signin_form_with username: 'admin@test.com', password: 'test123456'

    expect(current_path).to eq path
  end

  def login_an_user
    sign_in create(:user)
  end

  def login_an_admin
    sign_in create(:user, :admin)
  end
end
