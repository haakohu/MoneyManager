class CreateOutcomes < ActiveRecord::Migration[5.0]
  def change
    create_table :outcomes do |t|
      t.references :account, foreign_key: true
      t.float :amount
      t.string :description
      t.string :payee
      t.references :category, foreign_key: true
      t.date :transfer_date
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
