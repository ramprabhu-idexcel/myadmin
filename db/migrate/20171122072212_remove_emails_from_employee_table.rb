class RemoveEmailsFromEmployeeTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :employees, :office_email
    remove_column :employees, :personal_email
  end
end
