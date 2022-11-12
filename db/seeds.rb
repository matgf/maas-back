# frozen_string_literal: true

require 'faker'

puts '---Cleaning Database---'

Engineer.destroy_all
Shift.destroy_all
Service.destroy_all
ShiftEngineer.destroy_all

puts '--Creating Services--'

3.times do |i|
  Service.create(name: Faker::Commerce.department.to_s)
end

def create_engineers(service_id)
  3.times do |i|
    Engineer.new.tap do |engineer|
      engineer.first_name = Faker::DcComics.hero
      engineer.last_name = Faker::DcComics.hero
      engineer.service_id = service_id
      engineer.save
    end
  end
end

@monday = DateTime.now.beginning_of_week
@sunday = DateTime.now.end_of_week

##############
def create_shift_array(starting_hour, total_hours, service_id, date)
  hours_to_add = 0
  shift_array = []

  total_hours.times do |index|
    hours_to_add += 1
    shift_array << { start_time: starting_hour + index.hours, end_time: (starting_hour + hours_to_add.hours) }
  end

  shift_array.map do |sh|
    sh.merge({ service_id: service_id, date: date })
  end
end


# we have to create different schedules for weekdays and weekend
# starting_hour, total_hours_of_work
@shifts_schedules = [
  {
    # first example
    week: ['19:00:00 +0000', 5],
    weekend: ['10:00:00 +0000', 14]
  },
  {
    week: ['08:00:00 +0000', 8],
    weekend: ['10:00:00 +0000', 4]
  },
  {
    week: ['13:00:00 +0000', 10],
    weekend: ['10:00:00 +0000', 10]
  }
]
def create_shifts(service_id)
  # we create the shifts from monday to sunday
  @shifts_schedules.each do |sd|
    (@monday..@sunday).each do |day|
      if(day.wday != 6 || day.wday != 0)
        shifts_to_create = create_shift_array(
          DateTime.parse(sd[:week][0]),
          sd[:week][1],
          service_id,
          day
        )
      else
        shifts_to_create = create_shift_array(
          DateTime.parse(sd[:weekend][0]),
          sd[:weekend][1],
          service_id,
          day
        )
      end

      shifts_to_create.each do |shc|
        Shift.create(service_id: shc[:service_id], date: shc[:date])
      end
    end
  end
end

def create_shift_engineers(service_id, engineers)
  shift_engineers = []
  engineers.each do |engineer|

    Service.find(service_id).shifts.first(25).pluck(:id).each do |shift_id|
      shift_engineers << { engineer_id: engineer.id, shift_id: shift_id }
    end
  end

  shift_engineers.each do |se|
    ShiftEngineer.create(engineer_id: se[:service_id], shift_id: se[:shift_id])
  end
end

Service.all.each do |service|
  puts '-----------'
  puts "SERVICE: #{service.name}, id: #{service.id}"
  p 'Creating engineers'
  create_engineers(service.id)

  p 'Creating shifts'
  create_shifts(service.id)

  p 'Creating EngineerShifts'
  create_shift_engineers(service.id, service.engineers)
end

puts 'Seed Completed'
