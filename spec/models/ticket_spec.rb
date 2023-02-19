require 'rails_helper'

RSpec.describe Ticket do 
  describe 'relationship' do 
    it {should belong_to :employee}
  end

  describe 'validations' do 
    it {should validate_presence_of :subject}
    it {should validate_presence_of :age}
  end
end