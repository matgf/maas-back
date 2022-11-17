# frozen_string_literal: true

class Shift < ApplicationRecord
  belongs_to :service
  has_many :shift_engineers
  validates :service_id, presence: true
  validates :date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true

end
