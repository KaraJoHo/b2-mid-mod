require 'rails_helper'

RSpec.describe "Employee Show Page" do 
  before(:each) do 
    @department_1 = Department.create!(name: "Customer Service", floor: 2)
    @department_2 = Department.create!(name: "IT", floor: 4)

    @employee_1 = @department_1.employees.create!(name: "Sarah Joe", level: 2)
    @employee_2 = @department_1.employees.create!(name: "Sarah Joe", level: 3)

    @employee_3 = @department_2.employees.create!(name: "Sarah Joe", level: 4)

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

    @employee_ticket_5 = EmployeeTicket.create!(employee_id: @employee_3.id, ticket_id: @ticket_5.id)
    
  end

  describe "When visiting the mployee show page" do 
    it ' has the employee name and department'do 
      visit "/employees/#{@employee_1.id}"

      within(".details") do 
        expect(page).to have_content(@employee_1.name)
        expect(page).to have_content(@department_1.name)
      end

    end

    it 'has all tickets listed from oldest to youngest, and none not assigned to employee' do 
      visit "/employees/#{@employee_1.id}" 

      within(".tickets_oldest_to_youngest") do 
        expect(@ticket_1.subject).to appear_before(@ticket_2.subject)
        expect(page).to_not have_content(@ticket_4.subject)
      end

    end

    it 'has the oldest ticket listed separately' do 
      visit "/employees/#{@employee_1.id}" 

      within(".oldest_ticket") do 
        expect(page).to have_content(@ticket_1.subject)
      end
    end

    it 'has a form to add an existing ticket to this department?? and redirects to employee show page' do 
      visit "/employees/#{@employee_1.id}" 

      within(".tickets_oldest_to_youngest") do 
        expect(@ticket_1.subject).to appear_before(@ticket_2.subject)
        expect(page).to_not have_content(@ticket_4.subject)
      end

      within(".add_existing_ticket_form") do 
        fill_in("Ticket ID", with: @ticket_6.id)
        click_button("Submit")
        expect(current_path).to eq("/employees/#{@employee_1.id}")
      end

      within(".tickets_oldest_to_youngest") do 
        expect(page).to have_content(@ticket_6.subject)
      end




    end
  end
end