# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { create :user }

  describe 'validations' do
    it { expect(user).to be_valid }

    %i[username first_name last_name email phone date_of_birth password].each do |field_name|
      it { expect(user).to validate_presence_of(field_name) }
    end
  end

  describe 'user registration fail cases' do
    %w[username first_name last_name phone date_of_birth email password].each do |field|
      context "with empty #{field}" do
        before { user.public_send("#{field}=", '') }

        it 'sets validation error' do
          expect(user.tap(&:valid?).errors.full_messages).to include("#{field.humanize} can't be blank").once
        end
      end
    end
  end
end
