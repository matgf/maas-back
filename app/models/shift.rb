class Shift < ApplicationRecord
  belongs_to :service
  has_many :shift_engineers
end
