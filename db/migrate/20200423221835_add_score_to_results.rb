class AddScoreToResults < ActiveRecord::Migration[6.0]
  def change
    add_column :results, :score, :integer
  end
end
