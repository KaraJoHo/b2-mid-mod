class Employee < ApplicationRecord
  belongs_to :department

  validates_presence_of :name, :level
end