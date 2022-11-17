# frozen_string_literal: true

module Types
  module Query
    class ResetShifts < BaseQuery
      argument :service_id, ID, 'The id service to retrive shifts', required: true
      type [Types::ShiftType], null: false

      def resolve(service_id:)
        shifts_to_reset = Service.find(service_id).shifts
        shifts_to_reset.update_all(assigned: false, engineer_id: nil)

        Shifts::AssignShifts.new(service_id).call

        shifts_to_reset.reload
      end
    end
  end
end