 
require 'rails_helper'

RSpec.feature 'Login', type: :feature do
  let!(:user) { User.create(name: 'Shubham Singh', username: 'sgubp') }

  scenario 'User creates a new group' do
    visit '/signin'

    fill_in 'username', with: user.username
    click_button 'Log In'

    visit '/groups/new'

    fill_in 'group_name', with: 'Grouper '
    click_button 'Save'

    expect(page).to have_text('Grouper')
  end
end