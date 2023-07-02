class CreateScores < ActiveRecord::Migration[7.0]
  def change
    create_table :scores do |t|
      t.references :user, null: false, foreign_key: true
      t.references :song, null: false, foreign_key: true
      t.integer :key, default: 0, null: false
      t.decimal :score, precision: 5, scale: 3, null: false

      t.timestamps
    end
  end
end
