require 'rails_helper'

RSpec.describe "Department Index Page" do
  before(:each) do 
    @department_1 = Department.create!(name: "Customer Service", floor: 2)
    @department_2 = Department.create!(name: "IT", floor: 4)

    @employee_1 = @department_1.employees.create!(name: "Sarah Joe", level: 2)
    @employee_2 = @department_1.employees.create!(name: "Sarah Joe", level: 3)

    @employee_3 = @department_2.employees.create!(name: "Sarah Joe", level: 4)
    @employee_4 = @department_2.employees.create!(name: "Sarah Joe", level: 4)
    @employee_5 = @department_2.employees.create!(name: "Sarah Joe", level: 5)
  end

  describe 'When visiting the index page' do
     it 'has each departments name and floor and list of employees' do 
        visit "/departments"

        within("##{@department_1.id}") do 
          expect(page).to have_content(@department_1.name)
          expect(page).to have_content(@department_1.floor)
          expect(page).to have_content(@employee_1.name)
          expect(page).to have_content(@employee_2.name)
          expect(page).to_not have_content(@department_2.name)
        end

        within("##{@department_2.id}") do 
          expect(page).to have_content(@department_2.name)
          expect(page).to have_content(@department_2.floor)
          expect(page).to have_content(@employee_3.name)
          expect(page).to have_content(@employee_4.name)
          expect(page).to have_content(@employee_5.name)
          expect(page).to_not have_content(@department_1.name)
        end
     end

  end
end