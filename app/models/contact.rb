# frozen_string_literal: true

class Contact < ApplicationRecord
  validates :full_name, presence: true
  validates :email, email: { mode: :strict }
  validates :phone, presence: true,
                    format: { with: /^\+?\d{8,20}$/, multiline: true }
  validates :message, presence: true
end
