class AddTicketToEmployeeTickets < ActiveRecord::Migration[5.2]
  def change
    add_reference :employee_tickets, :ticket, foreign_key: true
  end
end
