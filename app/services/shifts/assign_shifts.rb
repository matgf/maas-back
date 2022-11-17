module Shifts
  class AssignShifts
    def initialize(service_id)
      @engineers = Service.find(service_id).engineers
    end

    def call
      assign_shifts
    end

    private

    def assign_shifts
      engineers_with_shifts_available = @engineers.map do |e|
        {
          engineer_id: e.id,
          shift_availables: e.shift_engineers.pluck(:shift_id)
        }
      end

      engineers_with_shifts_available.shuffle.each do |es|
        es[:shift_availables].shuffle.each do |id|
          shift = Shift.find(id)
          next if shift.assigned

          shift.update(assigned: true, engineer_id: es[:engineer_id])
        end
      end
    end
  end
end