class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.references :from, foreign_key: true
      t.references :to, foreign_key: true
      t.float :amount
      t.string :description
      t.date :transfer_date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
