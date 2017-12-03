class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.string :type
      t.string :name
      t.attachment :file
      t.timestamps
    end
  end
end
