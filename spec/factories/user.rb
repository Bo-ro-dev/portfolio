# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'password123' } # Domyślne hasło
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    date_of_birth { Faker::Date.birthday(min_age: 18, max_age: 65) }

    trait :just_registered do
      first_name { nil }
      last_name { nil }
      date_of_birth { nil }
    end
  end
end
