# frozen_string_literal: true

class User < ApplicationRecord
	has_one :order

	validates :name, :cpf, :email, presence: true
  validates :cpf, :email, uniqueness: { case_sensitive: false }
  validates :cpf, length: { is: 11 }
end
