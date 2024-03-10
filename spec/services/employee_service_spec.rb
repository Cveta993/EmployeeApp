# spec/services/employee_service_spec.rb

require 'rails_helper'

RSpec.describe EmployeeService do
  describe '.import_employees' do
    before do
      stub_request(:post, "https://beta.01cxhdz3a8jnmapv.com/api/v1/assignment/token/")
        .to_return(status: 200, body: '{"access_token": "mock_token"}', headers: {})

      stub_request(:get, "https://beta.01cxhdz3a8jnmapv.com/api/v1/assignment/employee/list")
        .to_return(status: 200, body: '[{"id": "8c8c13b6-35ed-3ffb-92d5-c438825df67f", "date_of_birth": "1968-05-29", "email": "andres34@gmail.com", "first_name": "Dayni", "last_name": "Mayez", "address": "18342 Alisa Square Suite 259", "country": "USA", "bio": "Bio here", "rating": 0.34}]', headers: {})
    end

    it 'imports employees from the API' do
      EmployeeService.import_employees
      expect(Employee.count).to eq(1)
    end
  end
end
