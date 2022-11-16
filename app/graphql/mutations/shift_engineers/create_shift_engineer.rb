# frozen_string_literal: true


module Mutations
  module ShiftEngineers
    # Mutation to create a new ShiftEngineer
    class CreateShiftEngineer < BaseMutation
      argument :shift_engineer, ShiftEngineerInput, required: true

      field :shift_engineer, Types::ShiftEngineerType, null: true

      def resolve(shift_engineer:)
        new_shift_engineer = ShiftEngineer.new(shift_id: shift_engineer[:shift_id], engineer_id: shift_engineer[:engineer_id])

        if new_shift_engineer.save
          new_shift_engineer.reload.shift.update(assigned: true)
        end
        {
          shift_engineer: new_shift_engineer
        }
      end
    end
  end
end