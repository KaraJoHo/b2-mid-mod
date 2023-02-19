require 'rails_helper'

RSpec.describe Ticket do 
  before(:each) do 
    @department_1 = Department.create!(name: "Customer Service", floor: 2)
    @department_2 = Department.create!(name: "IT", floor: 4)

    @employee_1 = @department_1.employees.create!(name: "Sarah Joe", level: 2)
    @employee_2 = @department_1.employees.create!(name: "Sarah Not joe", level: 3)
    @employee_3 = @department_2.employees.create!(name: "Joe Joe", level: 4)

    @employee_4 = @department_2.employees.create!(name: "Sarah Joe-Joe", level: 4) 

    @ticket_1 = Ticket.create!(subject: "A task", age: 2)
    @ticket_2 = Ticket.create!(subject: "Another task", age: 1)
    @ticket_3 = Ticket.create!(subject: "A hard task", age: 3)
    @ticket_4 = Ticket.create!(subject: "Another hard task", age: 2)
    @ticket_5 = Ticket.create!(subject: "An IT task", age: 2)
    @ticket_6 = Ticket.create!(subject: "An IT task", age: 2)

    @employee_ticket_1 = EmployeeTicket.create!(employee_id: @employee_1.id, ticket_id: @ticket_1.id)
    @employee_ticket_2 = EmployeeTicket.create!(employee_id: @employee_1.id, ticket_id: @ticket_2.id)

    @employee_ticket_3 = EmployeeTicket.create!(employee_id: @employee_2.id, ticket_id: @ticket_4.id)
    @employee_ticket_4 = EmployeeTicket.create!(employee_id: @employee_2.id, ticket_id: @ticket_3.id)
    @employee_ticket_4 = EmployeeTicket.create!(employee_id: @employee_2.id, ticket_id: @ticket_2.id)

    @employee_ticket_5 = EmployeeTicket.create!(employee_id: @employee_3.id, ticket_id: @ticket_5.id)
    @employee_ticket_6 = EmployeeTicket.create!(employee_id: @employee_3.id, ticket_id: @ticket_1.id)
  end
  describe 'relationship' do 
    it {should have_many :employees}
  end

  describe 'validations' do 
    it {should validate_presence_of :subject}
    it {should validate_presence_of :age}
  end
end