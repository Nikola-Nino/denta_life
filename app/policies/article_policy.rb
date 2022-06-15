# frozen_string_literal: true

class ArticlePolicy < ApplicationPolicy
  attr_reader :user, :article

  def initialize(user, article)
    @user = user
    @article = article
  end

  def new?
    user.admin?
  end

  def create?
    new?
  end

  def edit?
    user.admin? && article.user_id == user.id
  end

  def update?
    edit?
  end

  def show?
    return true if user.admin?
    return true if article.user_id == user.id

    false
  end

  def destroy?
    user.admin? && article.user_id == user.id
  end

  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        user.articles
      end
    end
  end
end
