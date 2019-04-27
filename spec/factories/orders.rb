# frozen_string_literal: true

FactoryBot.define do
  factory :order do
  	user { build(:user) }
    phone_model  { "#{Faker::Device.manufacturer} #{Faker::Device.model_name}" }
    imei 				 { Faker::Number.number(15) }
    annual_value { Faker::Number.decimal(3) }
    installments { rand(1..12) }
  end
end