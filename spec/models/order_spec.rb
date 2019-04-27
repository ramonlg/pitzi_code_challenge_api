# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:subject) { build(:order) }

  context 'Relationships' do
    it { is_expected.to belong_to :user }
  end

  context 'Validations' do
    it { is_expected.to validate_presence_of(:phone_model) }
    it { is_expected.to validate_presence_of(:imei) }
    it { is_expected.to validate_presence_of(:annual_value) }

		it { is_expected.to validate_uniqueness_of(:imei).ignoring_case_sensitivity }

    it { should validate_length_of(:imei).is_equal_to(15) }
  end
end