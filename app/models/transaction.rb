class Transaction < ApplicationRecord
  belongs_to :from, class_name:'Account'
  belongs_to :to, class_name:'Account'
  belongs_to :user
  validates :amount, presence:true
  validates :transfer_date, presence:true
  
end
