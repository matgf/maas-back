# frozen_string_literal: true

class Engineer < ApplicationRecord
  belongs_to :service
  has_many :shift_engineers
end
