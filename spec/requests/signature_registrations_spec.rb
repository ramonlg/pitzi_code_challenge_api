# frozen_string_literal: true

require 'rails_helper'
require 'json'

RSpec.describe 'SignatureRegistrations', type: :request do
	let(:valid_params) do
		{
			name:  			  Faker::Name.unique.name,
			cpf:   			  Faker::IDNumber.unique.brazilian_citizen_number,
    	email: 			  Faker::Internet.unique.email,
    	order_attributes: {
				phone_model:  "#{Faker::Device.manufacturer} #{Faker::Device.model_name}",
				imei: 			  Faker::Number.number(15),
				annual_value: Faker::Number.decimal(3),
				installments: rand(1..12)
			}
		}
	end

	let(:invalid_user_params) do
		{
			name:  			  Faker::Name.unique.name,
			cpf:   			  '',
    	email: 			  Faker::Internet.unique.email,
    	order_attributes: {
				phone_model:  "#{Faker::Device.manufacturer} #{Faker::Device.model_name}",
				imei: 			  Faker::Number.number(15),
				annual_value: Faker::Number.decimal(3),
				installments: rand(1..12)
			}
		}
	end

	let(:invalid_order_params) do
		{
			name:  			  Faker::Name.unique.name,
			cpf:   			  Faker::IDNumber.unique.brazilian_citizen_number,
    	email: 			  Faker::Internet.unique.email,
    	order_attributes: {
				phone_model:  "#{Faker::Device.manufacturer} #{Faker::Device.model_name}",
				imei: 			  '',
				annual_value: Faker::Number.decimal(3),
				installments: rand(1..12)
			}
		}
	end

  describe 'POST /api/v1/users' do
  	context 'when the request is invalid' do
  		context 'when the user data is wrong' do
	      before { post api_v1_signature_registrations_path, params: { registration: invalid_user_params } }

	      it 'must have http status 422' do
	        expect(response).to have_http_status(:unprocessable_entity)
	      end
	    end

	    context 'when the order data is wrong' do
	      before { post api_v1_signature_registrations_path, params: { registration: invalid_order_params } }

	      it 'must have http status 422' do
	        expect(response).to have_http_status(:unprocessable_entity)
	      end
	    end
    end

    context 'when the request is valid' do
    	let(:response_data) { JSON.parse(response.body)['data'] }

      before { post api_v1_signature_registrations_path, params: { registration: valid_params } }

      it 'must create a new user' do
        expect(response_data['user']).to eq(JSON.parse(User.last.to_json))
      end

      it 'must create a new order' do
        expect(response_data['order']).to eq(JSON.parse(Order.last.to_json))
      end

      it 'must have http status 201' do
        expect(response).to have_http_status(:success)
      end
    end
  end
end