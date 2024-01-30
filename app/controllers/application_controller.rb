# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :check_user_data, unless: -> { devise_controller? && params[:action] == 'destroy' }

  private

  def check_user_data
    if user_signed_in? && current_user.profile_data_missing?
      redirect_to edit_users_profile_path
    end
  end
end
