require 'rails_helper'

feature 'User sign in', %q{
  In order to be able ask question
  As an User want to be able to sing
} do 

  scenario 'Registered user try to sing in' do
    User.create!(email: 'user@example.com', password: '12345678')

    visit new_user_session_path
    fill_in 'Email', with: 'User@example.com'
    fill_in 'Password', with: '12345678'
    # save_and_open_page
    click_on 'Log in'

    expect(page).to have_content 'Signed in successfully.'
    expect(current_path).to eq root_path
  end

  scenario 'Not registered user try to sing in' do

    visit new_user_session_path
    fill_in 'Email', with: 'User@example.com'
    fill_in 'Password', with: '12345678'
    click_on 'Log in'

    expect(page).to have_content 'Invalid Email or password.'
    expect(current_path).to eq new_user_session_path
  end
end
