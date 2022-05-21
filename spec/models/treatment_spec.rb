# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Treatment, type: :model do
  subject(:treatment) { create(:treatment, user: user) }

  let(:user) { create :user }

  describe 'validations' do
    it { expect(treatment).to be_valid }
    it { expect(treatment).to validate_presence_of(:full_name) }
    it { expect(treatment).to validate_presence_of(:date_of_visit) }
    it { expect(treatment).to validate_presence_of(:diagnosis) }
    it { expect(treatment).to validate_presence_of(:treatment) }
    it { expect(treatment).to validate_presence_of(:special_conditions_and_additional_notes) }
  end
end

