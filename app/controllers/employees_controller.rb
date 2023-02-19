class EmployeesController < ApplicationController 
  def show 
    @employee = Employee.find(params[:employee_id])
    @shared_tickets = Employee.shared_tickets(@employee)
  end
end