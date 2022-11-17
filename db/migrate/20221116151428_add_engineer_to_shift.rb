class AddEngineerToShift < ActiveRecord::Migration[7.0]
  def change
    add_reference :shifts, :engineer, null: true
  end
end
