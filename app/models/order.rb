# frozen_string_literal: true

class Order < ApplicationRecord
	belongs_to :user

	validates :phone_model, :imei, :annual_value, presence: true
  validates :imei, uniqueness: { case_sensitive: false }
  validates :imei, length: { is: 15 }
end