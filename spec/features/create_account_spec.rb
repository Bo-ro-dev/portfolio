# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Creating an account', type: :feature do
  include Devise::Test::IntegrationHelpers

  scenario 'valid inputs', js: true do
    visit new_user_registration_path

    fill_in 'user_email', with: 'example@email.com'
    fill_in 'user_password', with: 'Password1'
    fill_in 'user_password_confirmation', with: 'Password1'
    click_on 'Sign Up'
    expect(page).to have_content('dashboard')
  end
end
