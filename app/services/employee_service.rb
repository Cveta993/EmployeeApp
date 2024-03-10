require 'net/http'
require 'uri'
require 'json'

class EmployeeService
  BASE_URL = "https://beta.01cxhdz3a8jnmapv.com/api/v1/assignment"

  def self.authenticate
    uri = URI("#{BASE_URL}/token/")
    response = Net::HTTP.post(uri, 
                              { grant_type: "password", client_id: "6779ef20e75817b79605", client_secret: "3e0f85f44b9ffbc87e90acf40d482602", username: "hiring", password: "tmtg" }.to_json,
                              "Content-Type" => "application/json")
    JSON.parse(response.body)["access_token"]
  end

  def self.fetch_employees
    access_token = authenticate
    uri = URI("#{BASE_URL}/employee/list")
    request = Net::HTTP::Get.new(uri)
    request["Authorization"] = "Bearer #{access_token}"

    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) { |http| http.request(request) }
    JSON.parse(response.body)
  end

  def self.import_employees
    employees = fetch_employees
    employees.each do |employee_data|
      Employee.create(employee_data.slice("id", "date_of_birth", "email", "first_name", "last_name", "address", "country", "bio", "rating"))
    end
  end
end
