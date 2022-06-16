# frozen_string_literal: true

require 'rails_helper'

describe ArticlesController, type: :controller do
  let!(:user) { create(:user) }
  let(:article) { create(:article, user: user) }

  describe 'GET articles' do
    it 'has a 200 status code' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET show' do
    it 'return http success' do
      get :show, params: { id: article.id }
      expect(response).to have_http_status(:success)
    end
  end
end
