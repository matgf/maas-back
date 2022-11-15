# frozen_string_literal: true

module Mutations
  module ShiftEngineers
    # Input object for Learning::Experience model
    class ShiftEngineerInput < BaseInputObjectType
      description 'Attributes for creating a Shift Engineer'

      argument :shift_id, ID, required: true
      argument :engineer_id, ID, required: true

    end
  end
end

