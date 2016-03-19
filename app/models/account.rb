class Account < ApplicationRecord

  validates :name, presence: true
  validates :balance, presence: true
  belongs_to :user
end
