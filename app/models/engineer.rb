# frozen_string_literal: true

class Engineer < ApplicationRecord
  belongs_to :service
  has_many :shift_engineers, dependent: :destroy
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :service_id, presence: true
end
