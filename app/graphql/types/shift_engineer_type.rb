# frozen_string_literal: true

module Types
  class ShiftEngineerType < Types::BaseObject
    field :id, ID, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :engineer_id, Integer
    field :shift_id, Integer, null: false
  end
end
