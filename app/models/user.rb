# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :treatments, dependent: :destroy
  has_many :articles, dependent: :destroy

  validates :first_name, :last_name, :phone, :username, :date_of_birth, presence: true
  validates :email, email: { mode: :strict }

  def admin?
    role == 'admin'
  end

  def manager?
    role == 'manager'
  end
end
