# frozen_string_literal: true

class ShiftEngineer < ApplicationRecord
  belongs_to :shift
  belongs_to :engineer

end
