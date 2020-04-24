class CreateResults < ActiveRecord::Migration[6.0]
  def change
    create_table :results do |t|
      t.integer :correct
      t.integer :possible
      t.integer :answer
      t.integer :distract
      t.references :assesments, null: false, foreign_key: true

      t.timestamps
    end
  end
end
