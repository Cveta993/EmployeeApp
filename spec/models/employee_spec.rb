# spec/models/employee_spec.rb

require 'rails_helper'

RSpec.describe Employee, type: :model do
  it 'is valid with valid attributes' do
    employee = Employee.new(id: 'unique_id', first_name: 'John', last_name: 'Doe', email: 'john.doe@example.com', date_of_birth: '1980-01-01', address: '123 Main St', country: 'USA', bio: 'A short bio here.', rating: 4.5)
    expect(employee).to be_valid
  end

  # Add more tests to validate your model constraints and validations
end
