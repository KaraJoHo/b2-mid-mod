class AddEmployeeToEmployeeTickets < ActiveRecord::Migration[5.2]
  def change
    add_reference :employee_tickets, :employee, foreign_key: true
  end
end
