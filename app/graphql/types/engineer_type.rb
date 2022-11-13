# frozen_string_literal: true

module Types
  class EngineerType < Types::BaseObject
    field :id, ID, null: false
    field :first_name, String
    field :last_name, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :service_id, Integer
  end
end
