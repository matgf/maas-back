# frozen_string_literal: true

class Service < ApplicationRecord
  has_many :engineers
  has_many :shifts
  validates :name, presence: true

end
