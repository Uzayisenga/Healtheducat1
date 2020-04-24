class AddMarksToResults < ActiveRecord::Migration[6.0]
  def change
    add_column :results, :marks, :integer
  end
end
