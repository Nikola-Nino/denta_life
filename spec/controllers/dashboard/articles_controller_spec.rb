# frozen_string_literal: true

require 'rails_helper'

describe Dashboard::ArticlesController, type: :controller do
  let!(:user) { create(:user, role: 'admin') }
  let!(:article) { create(:article, user: user) }
  let!(:article2) { create(:article, user: create(:user, role: 'admin')) }
  let!(:article_attributes) { attributes_for(:article) }

  before { sign_in user }

  describe 'GET articles' do
    render_views

    it 'has a 200 status code' do
      get :index
      expect(response).to have_http_status(:success)
      expect(response.body).to include(article.title)
      expect(response.body).not_to include(article2.title)
    end
  end

  describe 'GET article' do
    it 'has a 200 status code' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET show' do
    it 'return http success' do
      get :show, params: { id: article.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST create article' do
    context 'with valid attributes' do
      it 'creates new article' do
        expect do
          post :create,
               params: { article: article_attributes }
        end.to change(Article, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      it 'doesnt create new article' do
        expect do
          post :create,
               params: { article: {
                 title: ' ',
                 content: ' '
               } }
        end.to change(Article, :count).by(0)
      end
    end
  end
end
