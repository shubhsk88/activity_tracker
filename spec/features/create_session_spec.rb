require 'rails_helper'

RSpec.feature 'Login', type: :feature do
  let!(:user) { User.create(name: 'Shubham Singh', username: 'sgubp') }

  scenario 'User creates a new activities' do
    visit '/signin'

    fill_in 'username', with: user.username
    click_button 'Log In'

    visit '/sessions/new'

    fill_in 'session_name', with: 'Session of basketball'
    fill_in 'session_amount', with: 6
    
    click_button 'Save'
    visit '/sessions/filter/external'
    expect(page).to have_text('Session of basketball')
  end
end