class CreateEmployeeTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :employee_tickets do |t|
      t.bigint :employee_id
      t.bigint :ticket_id

      t.timestamps
    end
  end
end
