# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:subject) { build(:user) }

  context 'Relationships' do
    it { is_expected.to have_one :order }
  end

  context 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:cpf) }
    it { is_expected.to validate_presence_of(:email) }

		it { is_expected.to validate_uniqueness_of(:cpf).ignoring_case_sensitivity }
		it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity }

    it { should validate_length_of(:cpf).is_equal_to(11) }
  end
end
