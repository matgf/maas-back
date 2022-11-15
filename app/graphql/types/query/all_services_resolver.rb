# frozen_string_literal: true

module Types
  module Query
    class AllServicesResolver < BaseQuery

      type [Types::ServiceType], null: false

      def resolve
        Service.all
      end

    end
  end
end
