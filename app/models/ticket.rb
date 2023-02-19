class Ticket < ApplicationRecord 
  belongs_to :employee
  validates_presence_of :subject, :age
end