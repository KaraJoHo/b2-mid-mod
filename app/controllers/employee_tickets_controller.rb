class EmployeeTicketsController < ApplicationController 
  def create 
    EmployeeTicket.create!(join_table_params)
    redirect_to "/employees/#{params[:employee_id]}"
   
  end

  private 

  def join_table_params 
    params.permit(:employee_id, :ticket_id)
  end
end