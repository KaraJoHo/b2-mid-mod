class Employee < ApplicationRecord
  belongs_to :department
  has_many :tickets

  validates_presence_of :name, :level

  def order_tickets_oldest_youngest 
    tickets.order(:created_at)
  end
end