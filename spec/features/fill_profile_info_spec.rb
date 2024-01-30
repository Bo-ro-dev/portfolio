require 'rails_helper'

RSpec.describe 'Complete user profile', type: :feature do
  include Devise::Test::IntegrationHelpers

  let(:user) { create(:user, :just_registered) }

  scenario 'valid complete inputs', js: true do
    sign_in user 

    visit edit_users_profile_path(user)

    fill_in 'user_first_name', with: 'john'
    fill_in 'user_last_name', with: 'doe'
    fill_in 'user_date_of_birth', with: '1990-01-01'
    click_on 'Update Profile'

    expect(user.reload.name).to eq('John Doe')
    expect(page).to have_content('Dashboard')

    visit edit_users_profile_path(user)

    expect(page).to have_content('Not permitted.')
  end

  scenario 'valid incomplete inputs', js: true do
    sign_in user 

    visit edit_users_profile_path(user)

    fill_in 'user_first_name', with: 'John'
    click_on 'Update Profile'

    expect(page).to have_content('Please complete your profile before further proceeding')
    expect(page).to have_content("Last name can't be blank")
    expect(page).to have_content("Date of birth can't be blank")
  end
end