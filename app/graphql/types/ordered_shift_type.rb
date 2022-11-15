# frozen_string_literal: true

module Types
  class OrderedShiftType < Types::BaseObject
    field :dates, String
    field :shifts, [Types::ShiftType]
  end
end
