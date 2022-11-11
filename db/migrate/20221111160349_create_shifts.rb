class CreateShifts < ActiveRecord::Migration[7.0]
  def change
    create_table :shifts do |t|
      t.timestamps
      t.date :date
      t.boolean :assigned, default: new
      t.time :start_time
      t.time :end_time
    end
  end
end
