class TransferBase < ApplicationRecord
  belongs_to :user
  validates :amount ,presence: true
  validates :transfer_date, presence: true
end
