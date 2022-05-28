# frozen_string_literal: true

require 'rails_helper'

describe Dashboard::TreatmentsController, type: :controller do
  let!(:user) { create :user }
  let(:treatment) { create(:treatment, user: user) }
  let(:treatment_attributes) { attributes_for(:treatment) }

  before { sign_in user }

  describe 'GET dashboard/treatments' do
    it 'has a 200 status code' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET dashboard/treatment' do
    it 'has a 200 status code' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET show' do
    it 'return http success' do
      get :show, params: { id: treatment.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST create treatment' do
    context 'with valid attributes' do
      it 'creates new treatment' do
        expect do
          post :create,
               params: { treatment: treatment_attributes }
        end.to change(Treatment, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      it 'doesnt create new treatment' do
        expect do
          post :create,
               params: { treatment: {
                 full_name: ' ',
                 date_of_visit: ' ',
                 diagnosis: ' ',
                 treatment: ' ',
                 special_conditions_and_additional_notes: ' '
               } }
        end.to change(Treatment, :count).by(0)
      end
    end
  end
end
