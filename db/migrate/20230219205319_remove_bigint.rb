class RemoveBigint < ActiveRecord::Migration[5.2]
  def change
    remove_column :employee_tickets, :employee_id
    remove_column :employee_tickets, :ticket_id
  end
end
