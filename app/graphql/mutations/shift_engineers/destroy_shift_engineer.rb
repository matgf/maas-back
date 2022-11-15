# frozen_string_literal: true

module Mutations
  module ShiftEngineers
    # Mutation to delete a ShiftEngineer
    class DestroyShiftEngineer < BaseMutation
      argument :id, ID, required: true
      field :shift_engineer, Types::ShiftEngineerType, null: true

      def resolve(id:)
        shift_engineer = ShiftEngineer.find(id)

        shift_engineer.destroy
        {
          shift_engineer: shift_engineer
        }
      end
    end
  end
end