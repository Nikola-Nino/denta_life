# frozen_string_literal: true

require 'rails_helper'

describe PagesController, type: :controller do
  describe 'GET home' do
    it 'has a success status code' do
      get :home
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET contact' do
    it 'has a success status code' do
      get :contact
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST create_contact' do
    context 'with valid attributes' do
      it 'creates new contact' do
        expect do
          post :create_contact,
               params: { contact: { full_name: 'Random Name', email: 'test@test.com',
                                    message: 'Add somne message.', phone: '+3897777777' } }
        end.to change(Contact, :count).by(1)
      end
    end
  end
end
