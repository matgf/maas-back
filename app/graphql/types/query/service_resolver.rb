# frozen_string_literal: true

module Types
  module Query
    class ServiceResolver < BaseQuery
      type [Types::ServiceType], null: true

      def resolve
        Service.all
      end
    end
  end
end
