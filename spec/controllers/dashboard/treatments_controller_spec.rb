# frozen_string_literal: true

require 'rails_helper'

describe Dashboard::TreatmentsController, type: :controller do
  let!(:user) { create :user }
  let(:treatment_attributes) { attributes_for(:treatment) }

  before { sign_in user }

  describe 'GET dashboard/treatments' do
    it 'has a 200 status code' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end