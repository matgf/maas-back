# frozen_string_literal: true

module Types
  class ServiceType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :shifts, [Types::ShiftType]
    field :ordered_shifts, [Types::OrderedShiftType]

    field :engineers, [Types::EngineerType]

    def ordered_shifts
      sas = object.shifts.reduce({}) do |groups, shift|
        date = shift.date.to_s

        if groups[date].nil?
          groups[date] = []
        end

        groups[date] << shift

        groups
      end
      sas.map do |el|
        {
          dates: el.first,
          shifts: el.second
        }
      end
    end
  end
end
