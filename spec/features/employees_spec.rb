# spec/features/employees_spec.rb

require 'rails_helper'

RSpec.feature 'Employee Listing', type: :feature do
  scenario 'User visits the employees page' do
    Employee.create(first_name: 'John', last_name: 'Doe', email: 'john.doe@example.com')
    visit '/employees'
    expect(page).to have_content 'John Doe'
  end
end
