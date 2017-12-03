class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.date :dob
      t.string :place_of_birth
      t.string :office_email, null: false, default: ''
      t.string :personal_email, null: false, default: ''
      t.datetime :joining_date
      t.string :designation
      t.string :salary
      t.integer :total_experience
      t.string :citizenship
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
