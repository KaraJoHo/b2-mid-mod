require 'rails_helper'

RSpec.describe "Employee Show Page" do 
  before(:each) do 
    @department_1 = Department.create!(name: "Customer Service", floor: 2)
    @department_2 = Department.create!(name: "IT", floor: 4)

    @employee_1 = @department_1.employees.create!(name: "Sarah Joe", level: 2)
    @employee_2 = @department_1.employees.create!(name: "Sarah Joe", level: 3)

    @employee_3 = @department_2.employees.create!(name: "Sarah Joe", level: 4)

    @ticket_1 = @employee_1.tickets.create!(subject: "A task", age: 2)
    @ticket_2 = @employee_1.tickets.create!(subject: "Another task", age: 1)

    @ticket_3 = @employee_2.tickets.create!(subject: "A hard task", age: 3)
    @ticket_4 = @employee_2.tickets.create!(subject: "Another hard task", age: 2)

    @ticket_5 = @employee_3.tickets.create!(subject: "An IT task", age: 2)
    
  end

  describe "When visiting the mployee show page" do 
    it ' has the employee name and department'do 
      visit "/employees/#{@employee_1.id}"

      within(".details") do 
        expect(page).to have_content(@employee_1.name)
        expect(page).to have_content(@department_1.name)
      end

    end

    it 'has all tickets listed from oldest to youngest' do 
      visit "/employees/#{@employee_1.id}" 

      within(".tickets_oldest_to_youngest") do 
        expect(@ticket_1.subject).to appear_before(@ticket_2.subject)
      end

    end

    it 'has the oldest ticket listed separately' do 
      visit "/employees/#{@employee_1.id}" 

      within(".oldest_ticket") do 
        expect(page).to have_content(@ticket_1.subject)
      end
    end
  end
end