class Employee < ApplicationRecord
  belongs_to :department
  has_many :tickets

  validates_presence_of :name, :level
end