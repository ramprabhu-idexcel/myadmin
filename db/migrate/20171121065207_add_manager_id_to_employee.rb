class AddManagerIdToEmployee < ActiveRecord::Migration[5.0]
  def change
    add_column :employees, :manager_id, :integer
    add_index :employees, :manager_id
  end
end
