class RemoveEmployeeidFromTickets < ActiveRecord::Migration[5.2]
  def change
    remove_column :tickets, :employee_id
  end
end
