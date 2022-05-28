# frozen_string_literal: true

class Treatment < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  validates :full_name, :date_of_visit, :diagnosis, :treatment,
            presence: true
end
