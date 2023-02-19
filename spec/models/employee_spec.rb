require 'rails_helper'

RSpec.describe Employee, type: :model do
  before(:each) do 
    @department_1 = Department.create!(name: "Customer Service", floor: 2)
    @department_2 = Department.create!(name: "IT", floor: 4)

    @employee_1 = @department_1.employees.create!(name: "Sarah Joe", level: 2)
    @employee_2 = @department_1.employees.create!(name: "Sarah Joe", level: 3)

    @employee_3 = @department_2.employees.create!(name: "Sarah Joe", level: 4)

    @ticket_1 = @employee_1.tickets.create!(subject: "A task", age: 2)
    @ticket_2 = @employee_1.tickets.create!(subject: "Another task", age: 1)

    @ticket_4 = @employee_2.tickets.create!(subject: "Another hard task", age: 2)
    @ticket_3 = @employee_2.tickets.create!(subject: "A hard task", age: 3)

    @ticket_5 = @employee_3.tickets.create!(subject: "An IT task", age: 2)
  end
  describe 'relationships' do
    it { should belong_to :department }
    it {should have_many :tickets}
  end

  describe 'validations' do 
    it {should validate_presence_of :name}
    it {should validate_presence_of :level}
  end

  describe "#order_tickets_oldest_youngest" do 
    it 'orders the tickets from oldest to youngest' do 
      expect(@employee_1.order_tickets_oldest_youngest).to eq([@ticket_1, @ticket_2])
      expect(@employee_2.order_tickets_oldest_youngest).to eq([@ticket_4, @ticket_3])
    end
  end
end