# frozen_string_literal: true

class TreatmentPolicy < ApplicationPolicy
  attr_reader :user, :treatment

  def initialize(user, record)
    @user = user
    @record = record
  end

  def new?
    user.admin?
  end

  def create?
    new?
  end

  def show?
    return true if user.admin?
    return true if treatment.user_id == user.id

    false
  end

  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        user.treatments
      end
    end
  end
end
