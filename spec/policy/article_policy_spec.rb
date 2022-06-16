# frozen_string_literal: true

require 'rails_helper'

# describe ArticlePolicy do
#     article_policy(:article_policy) { described_class }
#     let!(:admin_user) { create: user, role: 'admin' }

#     context 'being a visitor' do
#         let(:user) { nil }

#         it { is_expected.to permit_action(:show) }
#         it { is_expected.to forbid_actions([:create, :update, :destroy, :edit]) }

#     end
# end

describe ArticlePolicy, type: :policy do
  subject(:article_policy) { described_class }

  let!(:admin_user) { create(:user, role: 'admin') }
  let!(:visitor_user) { create :user }
  let!(:admin_article) { create :article, user: admin_user }
  let!(:visitor_article) { create :article, user: visitor_user }

  permissions :new?, :create? do
    it 'denies access if user is not admin' do
      expect(article_policy).not_to permit(visitor_user)
    end

    it 'grants access if user is admin' do
      expect(article_policy).to permit(admin_user)
    end
  end

  permissions :edit?, :update? do
    it 'denies access if user is not admin for editing' do
      expect(article_policy).not_to permit(visitor_user, visitor_article)
    end

    it 'denies access if user is not author of article' do
      expect(article_policy).not_to permit(admin_user, visitor_article)
    end

    it 'grants access if user is admin & author of article' do
      expect(article_policy).to permit(admin_user, admin_article)
    end
  end
end
