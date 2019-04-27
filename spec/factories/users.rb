# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name 	{ Faker::Name.unique.name }
    cpf  	{ Faker::IDNumber.unique.brazilian_citizen_number }
    email	{ Faker::Internet.unique.email }
  end
end
