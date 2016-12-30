class CreateScores < ActiveRecord::Migration[5.0]
  def change
    create_table :scores do |t|
      t.integer :marks
      t.integer :attempt, default: 0
      t.integer :user_id
      t.string :section
      t.timestamps
    end
    add_index :scores, [:user_id]
  end
end
