# frozen_string_literal: true

require 'faker'

puts '---Cleaning Database---'

Engineer.destroy_all
Shift.destroy_all
Service.destroy_all
ShiftEngineer.destroy_all

puts '--Creating Services--'

3.times do |i|
  Service.create(name: "#{Faker::Commerce.department}#{i}")
end

def create_engineers(service_id)
  3.times do |i|
    Engineer.new.tap do |engineer|
      engineer.name = Faker::DcComics.hero
      engineer.service_id = service_id
      engineer.save
    end
  end
end

def create_shifts

end

p 'Creating engineers'
create_engineers(service.id)

p 'Creating shifts'
create_shifts(service.id)

puts 'Seed Completed'
