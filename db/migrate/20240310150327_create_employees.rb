class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.date :date_of_birth
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :country
      t.text :bio
      t.decimal :rating

      t.timestamps
    end
  end
end
