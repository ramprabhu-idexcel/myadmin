class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :type
      t.string :office_email
      t.string :personal_email
      t.string :mobile_no
      t.string :alternate_no
      t.string :landline
      t.string :door_no
      t.string :street
      t.string :city
      t.string :state
      t.string :pincode
      t.string :emergency_contact_name
      t.string :emergency_contact_no
      t.integer :person_id
      t.timestamps
    end
    add_index :contacts, :person_id
  end
end
