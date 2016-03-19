class AddProcessedToTransaction < ActiveRecord::Migration[5.0]
  def change
    add_column :transactions, :processed, :boolean
  end
end
