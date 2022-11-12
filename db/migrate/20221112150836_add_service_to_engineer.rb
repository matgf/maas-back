class AddServiceToEngineer < ActiveRecord::Migration[7.0]
  def change
    add_reference :engineers, :service, null: true, foreign_key: true
  end
end
