class Users::ProfileController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :check_user_data
  before_action :ensure_profile_not_completed

  def edit
    @user = current_user
    @user.attributes = user_params if params[:user].present?
    @user_errors = params[:user_errors]
  end

  def update
    @user = current_user
    normalize_user_params

    if @user.update(user_params)
      redirect_to root_path, notice: 'Profile updated successfully.'
    else
      error_messages = @user.errors.full_messages
      redirect_to edit_users_profile_path(user: user_params, user_errors: error_messages)
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :date_of_birth)
  end

  def normalize_user_params
    params[:user][:first_name]&.squish!&.gsub!(/\b\w/) { |match| match.capitalize }
    params[:user][:last_name]&.squish!&.gsub!(/\b\w/) { |match| match.capitalize }
  end

  def ensure_profile_not_completed
    unless current_user.profile_data_missing?
      flash[:alert] = 'Not permitted.'
      redirect_to root_path
    end 
  end
end