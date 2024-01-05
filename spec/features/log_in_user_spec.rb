# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Logging in', type: :feature do
  include Devise::Test::IntegrationHelpers

  before do
    @user = create(:user)
  end

  scenario 'valid inputs', js: true do
    visit new_user_session_path

    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    click_on 'Log in'
    expect(page).to have_content('Signed in successfully')
  end
end
