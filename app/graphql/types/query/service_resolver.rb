module Types
  module Query
    class ServiceResolver < BaseQuery

      argument :id, ID, 'The id of the service to retrieve', required: false
      type Types::ServiceType, null: false

      def resolve(id:)
        Service.find(id)
      end
    end
  end
end