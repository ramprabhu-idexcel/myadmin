class AddDesignationIdToEmployee < ActiveRecord::Migration[5.0]
  def change
    remove_column :employees, :designation
    add_column :employees, :designation_id, :integer
    add_index :employees, :designation_id
  end
end
