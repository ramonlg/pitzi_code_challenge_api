# frozen_string_literal: true

module Api
  module V1
    class SignatureRegistrationsController < ApplicationController
      def create
        @user = User.new(registration_params)
        if @user.save
          render json: { status: :sucess,
                         message: 'Assinatura cadastrada com sucesso!',
                         data: { user: @user, order: @user.order } },
                 status: :ok
        else
          render json: { status: :error,
                         message: @user.errors.full_messages.first,
                         data: @user.errors }, status: :unprocessable_entity
        end
      end

      private

      def registration_params
        params
          .require(:registration)
          .permit(:name, :cpf, :email,
                  order_attributes: [
                    :phone_model, :imei, :annual_value, :installments
                  ])
      end
    end
  end
end
