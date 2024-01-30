# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attr_accessor :name

  validates :first_name, :last_name, :date_of_birth, presence: true, on: :update

  def name
    "#{first_name} #{last_name}"
  end

  def profile_data_missing?
    first_name.blank? || last_name.blank? || date_of_birth.blank?
  end
end
