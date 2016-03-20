class AddProcessedToOutcome < ActiveRecord::Migration[5.0]
  def change
    add_column :outcomes, :processed, :boolean
  end
end
