# frozen_string_literal: true

require 'rails_helper'

describe Users::RegistrationsController, type: :controller do
  before { request.env['devise.mapping'] = Devise.mappings[:user] }

  describe 'extra params for updating a user' do
    let!(:user) { create(:user) }

    before { sign_in user }

    it 'updates user params' do
      params = attributes_for(:user, first_name: 'John', last_name: 'Doe',
                                     current_password: 'password')
      put :update, params: { user: params }
      user.reload
      expect(user.first_name).to eq('John')
      expect(user.last_name).to eq('Doe')
    end
  end
end
