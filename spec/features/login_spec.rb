require 'spec_helper'

RSpec.describe 'login followed by logout', type: :feature do
  # The user must exist so we are creating it here
  let!(:user) { User.create(name: 'Shubham Singh', username: 'sgubp') }

  scenario 'login page' do
    visit '/signin'

    fill_in 'username', with: user.username

    click_button 'Log In'
    sleep(3)
    expect(page).to have_content(user.name)

    click_on 'Log Out'
    sleep(3)
    expect(page). to have_text('Log In')
  end
end
