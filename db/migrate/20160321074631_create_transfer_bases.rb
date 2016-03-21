class CreateTransferBases < ActiveRecord::Migration[5.0]
  def change
    create_table :transfer_bases do |t|
      t.float :amount
      t.string :description
      t.date :transfer_date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
