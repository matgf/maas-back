# frozen_string_literal: true

module Types
  class ShiftType < Types::BaseObject
    field :id, ID, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :date, GraphQL::Types::ISO8601Date
    field :assigned, Boolean
    field :start_time, GraphQL::Types::ISO8601DateTime, null: false
    field :end_time, GraphQL::Types::ISO8601DateTime, null: false
    field :service_id, Integer
    field :shift_engineers, [Types::ShiftEngineerType]
  end
end

def start_time
  object.start_time.strftime('%H:%M %p')
end

def end_time
  object.end_time.strftime('%H:%M %p')
end
