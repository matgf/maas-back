class CreateShiftEngineers < ActiveRecord::Migration[7.0]
  def change
    create_table :shift_engineers do |t|
      t.timestamps
      t.references :engineer, null: true, foreign_key: true
      t.references :shift, null: false, foreign_key: true
    end
  end
end
