module Types
  class MutationType < Types::BaseObject

    field :CreateShiftEngineer, mutation: Mutations::ShiftEngineers::CreateShiftEngineer
    field :DestroyShiftEngineer, mutation: Mutations::ShiftEngineers::DestroyShiftEngineer

  end
end
