# frozen_string_literal: true

require 'rails_helper'

describe TreatmentPolicy, type: :policy do
  subject(:treatment_policy) { described_class }

  let!(:admin_user) { create(:user, role: 'admin') }
  let!(:visitor_user) { create :user }

  permissions :new?, :create? do
    it 'denies access if user is not admin' do
      expect(treatment_policy).not_to permit(visitor_user)
    end

    it 'grants access if user is admin' do
      expect(treatment_policy).to permit(admin_user)
    end
  end
end
